################################## Importing Libraries ###################

import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
import torch
import numpy as np

################################ Creating Dataset ############################

block_size = 20
with open('/Users/nimitt/Documents/DigitalSystems/Project/Datasets/advisories.txt','r') as file:
    text = file.read()
text = text.lower()

chars = ['\x00',
 '\t',
 '\n',
 ' ',
 '!',
 '"',
 '#',
 '$',
 '%',
 '&',
 "'",
 '(',
 ')',
 '*',
 '+',
 ',',
 '-',
 '.',
 '/',
 '0',
 '1',
 '2',
 '3',
 '4',
 '5',
 '6',
 '7',
 '8',
 '9',
 ':',
 ';',
 '<',
 '=',
 '>',
 '?',
 '@',
 '[',
 ']',
 '^',
 '_',
 '`',
 'a',
 'b',
 'c',
 'd',
 'e',
 'f',
 'g',
 'h',
 'i',
 'j',
 'k',
 'l',
 'm',
 'n',
 'o',
 'p',
 'q',
 'r',
 's',
 't',
 'u',
 'v',
 'w',
 'x',
 'y',
 'z',
 '~',
 '\xa0',
 '§',
 '·',
 'ं',
 'क',
 'ग',
 'त',
 'थ',
 'द',
 'ध',
 'न',
 'प',
 'भ',
 'य',
 'र',
 'स',
 'ा',
 'ि',
 'ी',
 'ो',
 'ौ',
 '्',
 '–',
 '‘',
 '’',
 '“',
 '”',
 '„',
 '‟',
 '•',
 '…',
 '\u2028',
 '₹',
 '→',
 '∑',
 '√',
 '≥',
 '□',
 '▪',
 '○',
 '●',
 '➢',
 '\uf020',
 '\uf02d',
 '\uf0a7',
 '\uf0b7',
 '\uf0d8',
 '\uf0fc',
 'ﬀ',
 'ﬁ',
 'ﬃ',
 '𝐶',
 '𝐼',
 '𝑃',
 '𝑆',
 '𝑐',
 '𝑔']

#  Removing unwanted chars
unwanted_chars = chars[68:]
for unwanted_char in unwanted_chars:
    if (unwanted_char in ['•',
                            '…',
                            '\u2028',
                            '₹',
                            '→',
                            '∑','√','≥','□','▪','○','●','➢','\uf020','\uf02d','\uf0a7','\uf0b7','\uf0d8','\uf0fc',]):
        text = text.replace(unwanted_char,"|")
    elif (unwanted_char in [ '‘',
 '’',
 '“',
 '”',
 '„',
 '‟',]):
        text = text.replace(unwanted_char,"'")
    else:
        text = text.replace(unwanted_char,"~")
text = text.replace('\n',"|")
text = text.replace('\t',"|")
text = text.replace('\x00',"|")

# Vocabulary
chars = sorted(set(text))   

stoi = {s:i for i,s in enumerate(chars)}
itos = {i:s for s,i in stoi.items()}

# Creating X and Y
X, Y = [],[]
context = []
for j in range(block_size):
    context = context + [stoi[text[j]]]

for i in range(block_size, len(text)):

    X_ = np.zeros((block_size,len(chars)))

    for j in range(block_size):
        X_[j][context[j]] = 1

    ch = text[i]
    ix = stoi[ch]


    X.append(X_)
    Y.append(ix)
    context = context[1:] + [ix] 

X = torch.tensor(np.array(X),dtype=torch.float32)
Y = torch.tensor(np.array(Y),dtype = torch.long)
Y = Y.unsqueeze(1)

####################################### Model ##############################

class LSTM(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(LSTM, self).__init__()
        self.hidden_size = hidden_size
        self.output_size = output_size

        # Forget Gate
        self.wf = nn.Parameter(torch.Tensor(hidden_size, input_size))
        self.bf = nn.Parameter(torch.Tensor(hidden_size, 1))

        # Input Gate
        self.wi = nn.Parameter(torch.Tensor(hidden_size, input_size))
        self.bi = nn.Parameter(torch.Tensor(hidden_size, 1))

        # Candidate Gate
        self.wc = nn.Parameter(torch.Tensor(hidden_size, input_size))
        self.bc = nn.Parameter(torch.Tensor(hidden_size, 1))

        # Output Gate
        self.wo = nn.Parameter(torch.Tensor(hidden_size, input_size))
        self.bo = nn.Parameter(torch.Tensor(hidden_size, 1))

        # Final Gate
        self.wy = nn.Parameter(torch.Tensor(output_size, hidden_size))
        self.by = nn.Parameter(torch.Tensor(output_size, 1))

        # Initialize parameters
        self.init_parameters()

    def init_parameters(self):
        # Initialize weights with Xavier initialization
        nn.init.xavier_uniform_(self.wf)
        nn.init.xavier_uniform_(self.wi)
        nn.init.xavier_uniform_(self.wc)
        nn.init.xavier_uniform_(self.wo)
        nn.init.xavier_uniform_(self.wy)

        # Initialize biases to zeros
        nn.init.constant_(self.bf, 0)
        nn.init.constant_(self.bi, 0)
        nn.init.constant_(self.bc, 0)
        nn.init.constant_(self.bo, 0)
        nn.init.constant_(self.by, 0)
        

    def forward(self, X):
        outputs = torch.zeros(self.output_size,1,dtype  = torch.float32)
        seq_length = X.size(0)
        hidden_state = torch.zeros(self.hidden_size,1,dtype=torch.float32)
        cell_state = torch.zeros(self.hidden_size,1,dtype = torch.float32)

        for q in range(seq_length):
            concat_input = torch.cat((hidden_state, X[q].unsqueeze(1)), dim=0)
            forget_gate = torch.sigmoid(torch.matmul(self.wf, concat_input) + self.bf)
            input_gate = torch.sigmoid(torch.matmul(self.wi, concat_input) + self.bi)
            candidate_gate = torch.tanh(torch.matmul(self.wc, concat_input) + self.bc)
            output_gate = torch.sigmoid(torch.matmul(self.wo, concat_input) + self.bo)

            cell_state = forget_gate * cell_state + input_gate * candidate_gate
            hidden_state = output_gate * torch.tanh(cell_state)

            outputs = torch.matmul(self.wy, hidden_state) + self.by

        return outputs
    
    def predict(self, X):
        out = [self.forward(x) for x in X]
        return torch.stack(out)
    
    def train(self, X, y, epochs, lr):
        optimizer = optim.Adam(self.parameters(), lr=lr)
        criterion = torch.nn.CrossEntropyLoss()  

        for epoch in range(epochs):
            epoch_loss = 0.0
            optimizer.zero_grad() 

            prediction = self.predict(X)
            target = y
            print(prediction.dtype)
            print(target.dtype)

            loss = criterion(prediction, target)
            loss.backward()
            optimizer.step()

            epoch_loss += loss.item()

            current_loss = epoch_loss / len(X)
            print(f"Epoch {epoch+1}/{epochs}, Loss: {current_loss:.4f}")

############################# Instantiating ###########################

hidden_size = 25
input_size = len(chars)
model = LSTM(hidden_size+input_size, hidden_size, input_size)

############################ Training ###############################

epochs = 5
lr = 0.01
model.train(X,Y,epochs,lr)

############################# Testing #################################

def convert_to_X(prompt):
    X_ = np.zeros((len(prompt),input_size))
    for i in range(len(prompt)):
        X_[i][stoi[prompt[i]]] = 1
    return torch.tensor(X_,dtype = torch.float32)
        
prompt = "iit gandhinagar"
max_len = 50
context = []
for j in range(len(prompt)):
    context = context + [stoi[prompt[j]]]
context = context[-block_size:]

text = prompt
for i in range(max_len):
    x = convert_to_X(text)
    y_pred = model(x)
    ix = torch.distributions.categorical.Categorical(logits=y_pred.squeeze()).sample().item()
    ch = itos[ix]
    text += ch
    context = context[1:] + [ix]

text = text.replace('|','\n')
print(text)

######################################################################