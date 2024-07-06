function adjust_pixel_values(image_path, scale_factor, translation_value)
  % Load the image
  img = imread(image_path);
  
  % Convert the image to double for mathematical operations
  img_double = im2double(img);
  
  % Scale the pixel values
  img_scaled = img_double * scale_factor;
  
  % Translate the pixel values
  img_translated = img_double + translation_value;
  
  % Ensure pixel values are within the valid range [0, 1]
  img_scaled = min(max(img_scaled, 0), 1);
  img_translated = min(max(img_translated, 0), 1);
  
  % Display the original and adjusted images
  figure;
  
  % Display original image
  subplot(1, 3, 1);
  imshow(img_double);
  title('Original Image');
  
  % Display scaled image
  subplot(1, 3, 2);
  imshow(img_scaled);
  title(sprintf('Scaled Image (factor: %.2f)', scale_factor));
  
  % Display translated image
  subplot(1, 3, 3);
  imshow(img_translated);
  title(sprintf('Translated Image (value: %.2f)', translation_value));
  
  disp('Image pixel values adjusted and displayed.');
end

% Usage example
image_path = 'image.jpg';
scale_factor = 1.5;  % Example scaling factor
translation_value = 0.2;  % Example translation value
adjust_pixel_values(image_path, scale_factor, translation_value);
