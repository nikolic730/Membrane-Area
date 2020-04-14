%%Import image and create ROI by selecting the bacterial cell. Subsequently
%%select all the membranes in the cell. Program will find the area of the
%%bacterial cell. The area of the membranes will also be calculated using
%%thresholding. The membrane pixel area will then be divided by the total
%%bacterial area to find the proportion of the cell occupied by the
%%membrane

im = imread('Area001.tif');
imshow(im)

h = drawassisted;

BacteriaROI = createMask(h);

% Count the number of pixels present in the ROI selected

counterROIpixels = double(0);
[RowNumROI,ColumnNumROI] = size(BacteriaROI);


for i=1:1: RowNumROI-1
    for ik=1:1: ColumnNumROI-1
        if(BacteriaROI(i,ik) == true)
            counterROIpixels = counterROIpixels + 1;
        end
    end
end             

prompt = "Enter the number of discontinuous membrane folds";
userInput = input(prompt);
membranes = userInput;

membraneArea = 0;

if(membranes >= 1)
    imshow(im)
    h1 = drawassisted;
    MembraneROI = createMask(h1);
    MembraneROIpixels = double(0);
    [RowNumMembraneROI,ColumnNumMembraneROI] = size(MembraneROI);


    for r=1:1: RowNumMembraneROI-1
        for c=1:1: ColumnNumMembraneROI-1
            if(MembraneROI(r,c) == true)
                membraneArea = membraneArea + 1;
            end
        end
    end
end    

if membranes >= 2
    imshow(im)
    h2 = drawassisted;
    MembraneROI2 = createMask(h2);
    MembraneROIpixels = double(0);
    [RowNumMembraneROI2,ColumnNumMembraneROI2] = size(MembraneROI2);


    for r=1:1: RowNumMembraneROI2-1
        for c=1:1: ColumnNumMembraneROI2-1
            if(MembraneROI2(r,c) == true)
                membraneArea = membraneArea + 1;
            end
        end
    end
end

proportion = membraneArea/counterROIpixels;
disp(proportion)


