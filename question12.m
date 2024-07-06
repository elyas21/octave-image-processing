pkg load image; % Load the image package

function compare_resolutions(image_path)
  % Load the original image
  img_original = imread(image_path);
  
  % Create different resolutions
  img_high_res = imresize(img_original, [1024, 1024]); % High resolution
  img_medium_res = imresize(img_original, [512, 512]); % Medium resolution
  img_low_res = imresize(img_original, [256, 256]); % Low resolution
  
  % Apply image processing tasks
  img_high_edge = edge(rgb2gray(img_high_res), 'canny');
  img_medium_edge = edge(rgb2gray(img_medium_res), 'canny');
  img_low_edge = edge(rgb2gray(img_low_res), 'canny');
  
  img_high_blur = imgaussfilt(img_high_res, 2);
  img_medium_blur = imgaussfilt(img_medium_res, 2);
  img_low_blur = imgaussfilt(img_low_res, 2);
  
  % Display original and processed images
  figure;
  
  % Display original images
  subplot(3, 3, 1); imshow(img_high_res); title('High Res (1024x1024)');
  subplot(3, 3, 2); imshow(img_medium_res); title('Medium Res (512x512)');
  subplot(3, 3, 3); imshow(img_low_res); title('Low Res (256x256)');
  
  % Display edge detection results
  subplot(3, 3, 4); imshow(img_high_edge); title('High Res Edges');
  subplot(3, 3, 5); imshow(img_medium_edge); title('Medium Res Edges');
  subplot(3, 3, 6); imshow(img_low_edge); title('Low Res Edges');
  
  % Display blurring results
  subplot(3, 3, 7); imshow(img_high_blur); title('High Res Blur');
  subplot(3, 3, 8); imshow(img_medium_blur); title('Medium Res Blur');
  subplot(3, 3, 9); imshow(img_low_blur); title('Low Res Blur');
  
  % Discuss impact on processing speed and quality
  fprintf('Image Resolution Comparison:\n');
  fprintf('High Resolution: 1024x1024\n');
  fprintf('Medium Resolution: 512x512\n');
  fprintf('Low Resolution: 256x256\n\n');
  
  fprintf('Impact on Processing Speed:\n');
  fprintf('Higher resolution images require more computational resources and time for processing. Edge detection and blurring on high resolution images will be slower compared to lower resolution images.\n\n');
  
  fprintf('Impact on Quality:\n');
  fprintf('Higher resolution images retain more details and produce better quality results. For tasks like edge detection, high resolution images capture finer details, while low resolution images might miss some edges or produce less accurate results.\n');
  fprintf('For blurring, high resolution images show smoother transitions, while low resolution images might appear more pixelated or lose more details.\n');
end

% Usage example
image_path = 'image.jpg';
compare_resolutions(image_path);
