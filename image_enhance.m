clear
clc

g=0.5;

folder_list=dir("data");
len_folder=length(folder_list);

% for k = 1:len_folder-2
for k = 5:5
    foldername=folder_list(2+k).name;
    path = "data\"+ string(foldername);

    namelist=dir(path+"\*.mat");


    len_data=length(namelist);
    for n = 1: len_data
        datapath = path+"\"+string(namelist(n).name);
        M = mueller_transform(datapath,4);
        [Lg,e]=Magnetic_laplacian(M,g);
        
        % S = size(e);
        % e = reshape(e,S(2)*S(3),4);
        % Y = tsne(e, Algorithm="barneshut");
        E1=squeeze(e(1,:,:));
        E1 = img_normalize(E1);
        % E1 = rescale(E1,0,1);
        E2=squeeze(e(2,:,:));
        E2 = rescale(E2,0,1);

        E3=squeeze(e(3,:,:));
        E3 = rescale(E3,0,1);

        E4=squeeze(e(4,:,:));
        E4 = rescale(E4,0,1);

        imwrite(E1,"1st_eig"+string(namelist(n).name)+".jpg")
        imwrite(E2,"2nd_eig"+string(namelist(n).name)+".jpg")
        imwrite(E3,"3rd_eig"+string(namelist(n).name)+".jpg")
        imwrite(E4,"4th_eig"+string(namelist(n).name)+".jpg")

        % RGB(:,:,1)=E2;
        % RGB(:,:,2)=E3;
        % RGB(:,:,3)=E4;
        % imwrite(RGB,"RGB"+string(namelist(n).name)+".jpg")
        % clear RGB

    end
end