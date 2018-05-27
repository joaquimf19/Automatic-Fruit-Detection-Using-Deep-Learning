#import Image
from PIL import Image
import os
import glob

def crop(im,filename):

    box_list = [[0,0,819,489],[742,0,1561,489],[1483,0,2303,489],
                [0,383,819,873],[742,383,1561,873],[1483,383,2303,873],
                [0,661,819,1151],[742,661,1561,1151],[1483,661,2303,1151],
                [0,1045,819,1535],[742,1045,1561,1535],[1483,1045,2303,1535]]
    for i in range(len(box_list)):
        # print (i,j)
        #print i
        #box = (j*width, i*height, (j+1)*width, (i+1)*height)
        box = (box_list[i][0], box_list[i][1], box_list[i][2], box_list[i][3])
        #yield im.crop(box)
        path = 'split_images_12/' + filename + str(int(i+1)) + '.JPG'
        im_cropped = im.crop(box)
        im_flip = im_cropped.rotate(-90)
        im_flip.save(path)
        imgwidth, imgheight = im_flip.size
        #print 'Image size is: %d x %d ' % (imgwidth, imgheight)

if __name__=='__main__':
    # change the path and the base name of the image files 
    #imgdir = '../test_splitter/img'
    #basename = 'img-*.tif'
    imgdir = 'py-faster-rcnn-2/py-faster-rcnn/data/subset_1/data/Images'
    basename = 'DSIR*.JPG'
    filelist = glob.glob(os.path.join(imgdir,basename))
    for filenum,infile in enumerate(filelist):
        # infile='/Users/alex/Documents/PTV/test_splitter/cal/Camera 1-1-9.tif'
        print filenum # keep the numbers as we change them here
        print infile
        filename = infile.strip('py-faster-rcnn-2/py-faster-rcnn/data/subset_1/data/Images/')
        filename = filename.strip('.JPG')
        im = Image.open(infile)
        #im = PIL.Image.open(infile)
        imgwidth, imgheight = im.size
        print 'Image size is: %d x %d ' % (imgwidth, imgheight)
        #height = imgheight/4
        #width =  imgwidth/3
        #start_num = 0
        #path = 'split_images_12/' + filename + str(int(k+1)) + '.JPG'
        crop(im,filename)
        #for k,piece in enumerate(crop(im,height,width),start_num):
            # print k
            # print piece
            #img=Image.new('RGB', (width,height), 255)
            # print img
            #img.paste(piece)
            #path = os.path.join("split_images/" % (filename,int(k+1)))
            #path = 'split_images_12/' + filename + str(int(k+1)) + '.JPG'
            #print path
            #img.save(path)
            #os.rename(path,os.path.join((filename,int(k+1))))
        
