import os
import time
import selenium
import jieba

print(time.strftime("%Y-%m-%d %X"))

seg_list = jieba.cut("我来到北京清华大学", cut_all=True)
print("Full Mode: " + "/ ".join(seg_list))