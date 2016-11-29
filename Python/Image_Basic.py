from PIL import Image, ImageFilter
import glob
import os
import xml.etree.cElementTree as ET
import sys

image_path = '/home/marvin/marvin/software/Python/image/JPEGImages/'
xml_path = '/home/marvin/marvin/software/Python/image/xml/'
output_path = '/home/marvin/marvin/software/Python/image/xml_output/'

# im = Image.open(image_path + '000001.jpg')
# print(glob.glob(image_path + '*.jpg'))
# print(im.size)
# a = im.size[0]
# b = im.size[1]
# print(a)

# get current dir's all file
img_name = os.listdir(image_path)

for i in img_name:
    im = Image.open(image_path + i)
    n = i.replace('.jpg', '')
    xml_p = n+'.xml'
    # read xml
    tree = ET.ElementTree(file= xml_path + xml_p)
    root = tree.getroot()
    # change sub element width and height
    root[4][0].text = str(im.size[0])
    root[4][1].text = str(im.size[1])
    tree.write(output_path + xml_p)

# tree = ET.ElementTree(file='000001.xml')
# root = tree.getroot()
# root['width'].set(100)
# root['height'].set(100)
# print(root[4].tag, root[4].attrib)
# root[4][0].text = str(100)
# root[4][1].text = str(100)
# tree.write('000001.xml')