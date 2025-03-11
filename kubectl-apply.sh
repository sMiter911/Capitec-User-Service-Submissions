#!/bin/bash

# Define the directory containing the services
SERVICES_DIR="services"

# Check if the services directory exists
if [ ! -d "$SERVICES_DIR" ]; then
  echo "Services directory not found!"
  exit 1
fi

# Find all deployment and service YAML files and run them
for file in $(find $SERVICES_DIR -type f -name "*.yml" -o -name "*.yaml"); do
  echo "Processing $file..."
  
  # Assuming you are using kubectl to apply the YAML files
  kubectl apply -f $file
  
  if [ $? -ne 0 ]; then
    echo "Failed to apply $file"
    exit 1
  fi
done

echo "All files processed successfully."