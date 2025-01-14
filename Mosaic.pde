PImage[] images = new PImage[20];  // Array tol hold 20 images
int gridRows = 5;  // Number of rows in mosaic grid
int gridCols = 4;  // Number of columns in mosaic grid
int cellWidth, cellHeight;  // Dimension of each mosaic cell

void setup() {
  size(800, 800);  // Setup canvas
  loadImages();  // Load images into the array
  cellWidth = width / gridCols;  // Calculate the cell width based on the grid
  cellHeight = height / gridRows;  // Calculate the cell height based on the grid
  noLoop();  // Stop the continuous draw; we only need the draw once
}

void draw() {
  background(255);  // Set background white
  
  // Loop through grid columns and rows
  for (int row = 0; row < gridRows; row++) {
    for (int col = 0; col < gridCols; col++) {
      // Pick a random image from the index
      int randomIndex = int(random(20));
      
      // Get the y and x position for the current cell
      int x = col * cellWidth;
      int y = row * cellHeight;
      
      // Draw a resized image to fit the grid cell
      image(images[randomIndex], x, y, cellWidth, cellHeight);
    }
  }
}

// Load images from the data folder
void loadImages() {
  for (int i = 0; i < images.length; i++) {
    String fileName = "image" + (i + 1) + ".jpg";  // Name format is image1-image20
    images[i] = loadImage(fileName);  // Load each individual image into the array
    if (images[i] == null) {
      println("Error loading image: " + fileName);
    }
  }
}
