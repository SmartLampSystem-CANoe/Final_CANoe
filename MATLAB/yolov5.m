
%name = 'tiny-yolov3-coco';
%detector = yolov3ObjectDetector(name);
img = imread('C:\Users\user\Pictures\Screenshots\center-night-HB.png');
img = preprocess(detector,img);
img = im2single(img);
[bboxes,scores,labels] = detect(detector,img,'DetectionPreprocessing','none');

sz = size(bboxes);
sz = sz(1);

if sz > 0
    detectedImg = insertObjectAnnotation(img,'Rectangle',bboxes(1, :),scores(1, 1));

    a = 1;
    for i = 2:sz
        if bboxes(i, 3) < 40
            continue;
        end
    
        if a == 1
            a = 0;
        else
            detectedImg = insertObjectAnnotation(detectedImg,'Rectangle',bboxes(i, :),scores(i, 1));
        end
    
    end

    figure
    imshow(detectedImg)
end