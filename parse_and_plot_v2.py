import matplotlib.pyplot as plt #import package to plot
lines = [] #Declare an empty list named "lines"
accuracy_lines = []
loss_lines = []
lines_not_interesting = [] #Declare an empty list named "lines_not_interesting"

#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-04-24_13-44-12', 'rt') as in_file:  #Open log file for reading of text data.
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-04-26_14-43-09', 'rt') as in_file:
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-02_18-23-40', 'rt') as in_file:    
#19.5k iter lr = 0.001 subset_1
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-02_20-57-07', 'rt') as in_file:
#imatges nostres
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-03_00-04-37', 'rt') as in_file:
#canviat x per y
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-03_13-32-06', 'rt') as in_file:
#dividint imatges en 4
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-03_15-33-17', 'rt') as in_file:
#30k iter lr = 0.002 subset_1(yx)
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-03_19-10-06', 'rt') as in_file:
#30k iter lr = 0.002 subset_1(yx)
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-03_22-07-35', 'rt') as in_file:


#3r es el bo de UW
with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-04-25_00-05-21', 'rt') as in_file:

#10k iter lr = 0.001 subset_1 split images in 12 (annots meh)
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-08_22-52-46', 'rt') as in_file:

#10k iter lr = 0.001 subset_1 split in 12 images finetuned from UW
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-10_22-34-33', 'rt') as in_file:

#10k iter lr = 0.0001 subset_1 split in 12 images finetuned from UW
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-10_23-54-33', 'rt') as in_file:

#10k iter lr = 0.001 subset_1 split images in 12 corrected annots
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-11_01-15-34', 'rt') as in_file:

#10k iter lr = 0.0001 subset_1 split in 12 images finetuned from UW (annots meh)
#with open ('py-faster-rcnn-2/py-faster-rcnn/experiments/logs/faster_rcnn_end2end_ZF_.txt.2018-05-12_07-58-20', 'rt') as in_file:

    for line in in_file: #For each line of text store in a string variable named "line"
        lines.append(line)  #add that line to our list of lines.
for i in range (len(lines)): #for each line
    if ' loss = ' in lines[i]:
        loss_lines.append(i)
    if ' accuracy = ' in lines[i]:
		accuracy_lines.append(i)
print('total accuracy lines') 
print(len(accuracy_lines)) #print total number of lines
print('total loss lines') 
print(len(loss_lines)) #print total number of lines

#print('Lines that do not have info to plot')
#print(len(lines_not_interesting))        #print total number of lines not interesting
#print('Lines that do have info to plot')
#print(len(lines)-len(lines_not_interesting)) #print total number of lines interesting

#for index in sorted(lines_not_interesting, reverse=True): #remove not important lines in reverse order to not mess with indexes
#    del lines[index] #delete by index
#print('total lines') 
#print(len(lines)) #check the lines remaining match the lines interesting

iterations = []
losses = []
accuracy = []

#print(lines[loss_lines[0]])
#print(lines[accuracy_lines[0]])


for j in range(len(loss_lines)):
    it = lines[loss_lines[j]].split()[5].replace(",","")
    iterations.append(int(it))
    l = lines[loss_lines[j]].split()[8].replace("\n","")
    losses.append(float(l))
    acc = lines[accuracy_lines[j]].split()[10].replace(",","")
    accuracy.append(float(acc))

plt.plot(iterations,losses, label='Loss')
plt.plot(iterations,accuracy, label='Accuracy')
plt.ylabel('Loss curve')
plt.xlabel('iterations')
plt.legend(loc=9,ncol=2)
#plt.legend(handles=[loss_legend, accuracy_legend])
#plt.legend([loss_legend, accuracy_legend], ['Loss', 'Accuracy'])
plt.show()

#plt.plot(iterations, losses)
#plt.ylabel('Loss curve for Underwood_1')
#plt.ylabel('Loss curve for subset_1')
#plt.show()

