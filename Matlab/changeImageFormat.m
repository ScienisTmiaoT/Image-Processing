%%
%图片保存路径为：
%E:\image\car
%E:\image\person
%car和person是保存车和行人的文件夹
%这些文件夹还可以有多个，
%放在image文件夹里就行
%该代码的作用是将图片名字改成000123.jpg这种形式
%%
clc;
clear;

maindir='G:\marvin\dataset\data\select\anno\';
subdir = dir(maindir);
name_long=6; %图片名字的长度，如000123.jpg为6,最多9位,可修改
num_begin=1; %图像命名开始的数字如000123.jpg开始的话就是123

for i = 1:length(subdir)
  if ~strcmp(subdir(i).name ,'.') && ~strcmp(subdir(i).name,'..')
     subsubdir = dir(strcat(maindir,subdir(i).name));
    for j=1:length(subsubdir)
         if ~strcmp(subsubdir(j).name ,'.') && ~strcmp(subsubdir(j).name,'..')
           img=imread([maindir,subdir(i).name,'\',subsubdir(j).name], 'bmp');
           str=num2str(num_begin,'%09d');
           newname=strcat(str,'.jpg');
           newname=newname(end-(name_long+3):end);
           %strrep replace string's bmp with jpg
           %newname=strrep(subsubdir(j).name,'bmp','jpg');
           imwrite(img, newname, 'jpg');
           num_begin=num_begin+1;
           %pause(0.1);%可以将暂停去掉
         end
    end
  end
end