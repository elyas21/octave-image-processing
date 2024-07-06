function extract_and_display_metadata(image_path)
  % Extract metadata from the image
  info = imfinfo(image_path);
  
  % Display metadata
  fprintf('Metadata for %s:\n', image_path);
  fprintf('  Filename: %s\n', info.Filename);
  fprintf('  File Size: %d bytes\n', info.FileSize);
  fprintf('  Format: %s\n', info.Format);
  fprintf('  Format Version: %s\n', info.FormatVersion);
  fprintf('  Width: %d pixels\n', info.Width);
  fprintf('  Height: %d pixels\n', info.Height);
  fprintf('  Color Type: %s\n', info.ColorType);
  fprintf('  Bit Depth: %d\n', info.BitDepth);
  
  % Display additional metadata if available
  if isfield(info, 'DateTime')
    fprintf('  Creation Date: %s\n', info.DateTime);
  end
  if isfield(info, 'ResolutionUnit')
    fprintf('  Resolution Unit: %s\n', info.ResolutionUnit);
  end
  if isfield(info, 'XResolution')
    fprintf('  X Resolution: %f\n', info.XResolution);
  end
  if isfield(info, 'YResolution')
    fprintf('  Y Resolution: %f\n', info.YResolution);
  end
  if isfield(info, 'Comment')
    fprintf('  Comment: %s\n', info.Comment);
  end
  
  fprintf('\n');
end

% Usage example
image_path = 'image.jpg';
extract_and_display_metadata(image_path);
