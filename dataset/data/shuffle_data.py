import os
import sys
import random

f1 = open('type_src_train.txt','r')
f2 = open('type_src_dev.txt','r')
f3 = open('type_src_test.txt','r')

f4 = open('type_tgt_train.txt','r')
f5 = open('type_tgt_dev.txt','r')
f6 = open('type_tgt_test.txt','r')

srcs = [f1.readlines()+f2.readlines()+f3.readlines()]
tgts = [f4.readlines()+f5.readlines()+f6.readlines()]
ids = []


for i,each in enumerate(srcs[0]):
    ids.append(i)


random.shuffle(ids)
print(ids)
ff1 = open('shuffled_type_src_test.txt','w')
ff2 = open('shuffled_type_tgt_test.txt','w')
for i in range(1000):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()
ff1 = open('shuffled_type_src_dev.txt','w')
ff2 = open('shuffled_type_tgt_dev.txt','w')
for i in range(1000,2000):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()
ff1 = open('shuffled_type_src_train.txt','w')
ff2 = open('shuffled_type_tgt_train.txt','w')
for i in range(2000,len(ids)):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()


f1 = open('mention_src_train.txt','r')
f2 = open('mention_src_dev.txt','r')
f3 = open('mention_src_test.txt','r')

f4 = open('mention_tgt_train.txt','r')
f5 = open('mention_tgt_dev.txt','r')
f6 = open('mention_tgt_test.txt','r')

srcs = [f1.readlines()+f2.readlines()+f3.readlines()]
tgts = [f4.readlines()+f5.readlines()+f6.readlines()]

ff1 = open('shuffled_mention_src_test.txt','w')
ff2 = open('shuffled_mention_tgt_test.txt','w')
for i in range(1000):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()
ff1 = open('shuffled_mention_src_dev.txt','w')
ff2 = open('shuffled_mention_tgt_dev.txt','w')
for i in range(1000,2000):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()
ff1 = open('shuffled_mention_src_train.txt','w')
ff2 = open('shuffled_mention_tgt_train.txt','w')
for i in range(2000,len(ids)):
    ff1.write(srcs[0][ids[i]])
    ff2.write(tgts[0][ids[i]])
ff1.close()
ff2.close()




