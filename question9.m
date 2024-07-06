function load_and_display_images(image_path)
  % Load an image from the specified path
  img = imread(image_path);
  
  % Convert the image to different color spaces
  img_gray = rgb2gray(img);  % Convert to grayscale
  img_hsv = rgb2hsv(img);    % Convert to HSV
  
  % Display the original and converted images
  figure;
  
  % Display original RGB image
  subplot(2, 2, 1);
  imshow(img);
  title('Original RGB Image');
  
  % Display grayscale image
  subplot(2, 2, 2);
  imshow(img_gray);
  title('Grayscale Image');
  
  % Display HSV image
  subplot(2, 2, 3);
  imshow(img_hsv);
  title('HSV Image');
  
  % Convert RGB to CMYK and display CMYK image
  % Note: Octave does not have a direct function to convert RGB to CMYK,
  % so we will implement the conversion manually.
  img_cmyk = rgb2cmyk(img);
  subplot(2, 2, 4);
  imshow(img_cmyk(:,:,1:3)); % Display CMY channels only (K channel is black)
  title('CMY Image');
  
  disp('Images loaded and displayed in different color spaces.');
end

function cmyk = rgb2cmyk(rgb)
  % Convert RGB to CMYK
  % Reference: https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
  c = 1 - double(rgb(:,:,1)) / 255;
  m = 1 - double(rgb(:,:,2)) / 255;
  y = 1 - double(rgb(:,:,3)) / 255;
  
  k = min(min(c, m), y);
  c = (c - k) ./ (1 - k + eps); % Add eps to avoid division by zero
  m = (m - k) ./ (1 - k + eps);
  y = (y - k) ./ (1 - k + eps);
  
  cmyk = cat(3, c, m, y, k);
end
