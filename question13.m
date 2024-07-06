pkg load image; % Load the image package

function convert_and_process(image_path)
  % Load the original image
  img_original = imread(image_path);
  
  % Convert to grayscale
  img_gray = rgb2gray(img_original);
  
  % Convert to HSV
  img_hsv = rgb2hsv(img_original);
  
  % Extract HSV channels
  img_hue = img_hsv(:,:,1);
  img_saturation = img_hsv(:,:,2);
  img_value = img_hsv(:,:,3);
  
  % Apply edge detection
  edges_gray = edge(img_gray, 'canny');
  edges_hue = edge(img_hue, 'canny');
  edges_saturation = edge(img_saturation, 'canny');
  edges_value = edge(img_value, 'canny');
  
  % Apply simple thresholding for segmentation
  threshold = 0.5;
  seg_gray = im2bw(img_gray, threshold);
  seg_hue = im2bw(img_hue, threshold);
  seg_saturation = im2bw(img_saturation, threshold);
  seg_value = im2bw(img_value, threshold);
  
  % Display the results
  figure;
  
  % Original image
  subplot(4, 3, 1);
  imshow(img_original);
  title('Original Image');
  
  % Grayscale image
  subplot(4, 3, 2);
  imshow(img_gray);
  title('Grayscale Image');
  
  % HSV image (only displaying the hue channel for visualization)
  subplot(4, 3, 3);
  imshow(img_hue);
  title('Hue Channel');
  
  % Edge detection results
  subplot(4, 3, 4);
  imshow(edges_gray);
  title('Edges (Grayscale)');
  
  subplot(4, 3, 5);
  imshow(edges_hue);
  title('Edges (Hue)');
  
  subplot(4, 3, 6);
  imshow(edges_saturation);
  title('Edges (Saturation)');
  
  subplot(4, 3, 7);
  imshow(edges_value);
  title('Edges (Value)');
  
  % Segmentation results
  subplot(4, 3, 8);
  imshow(seg_gray);
  title('Segmentation (Grayscale)');
  
  subplot(4, 3, 9);
  imshow(seg_hue);
  title('Segmentation (Hue)');
  
  subplot(4, 3, 10);
  imshow(seg_saturation);
  title('Segmentation (Saturation)');
  
  subplot(4, 3, 11);
  imshow(seg_value);
  title('Segmentation (Value)');
  
  % Discussion
  disp('Impact of Color Representation on Image Processing Tasks:');
  disp('1. Edge Detection:');
  disp('   - Grayscale: Edges are detected based on intensity differences.');
  disp('   - Hue: Edges are detected based on changes in color tone.');
  disp('   - Saturation: Edges are detected based on changes in color intensity.');
  disp('   - Value: Edges are detected based on changes in brightness.');
  
  disp('2. Segmentation:');
  disp('   - Grayscale: Simple thresholding can separate foreground and background based on intensity.');
  disp('   - Hue: Thresholding can separate regions based on dominant color tones.');
  disp('   - Saturation: Thresholding can separate regions based on color intensity.');
  disp('   - Value: Thresholding can separate regions based on brightness.');
end

% Usage example
image_path = 'image.jpg';
convert_and_process(image_path);
