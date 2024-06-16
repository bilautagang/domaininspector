#!/bin/bash

# Check if the input file was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file> [output_file]"
  exit 1
fi

# Set input and output file names
INPUT_FILE="$1"
OUTPUT_FILE="${2:-live_domains.txt}"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found."
  exit 1
fi

# Function to check if a domain is live
check_live_domain() {
  DOMAIN="$1"
  if curl -Is --connect-timeout 5 "$DOMAIN" &> /dev/null; then
    echo "Alive Domain Found -- $DOMAIN"
    echo "$DOMAIN" >> "$OUTPUT_FILE"
  fi
}

export -f check_live_domain
export OUTPUT_FILE

# Clear the output file
> "$OUTPUT_FILE"

# Read domains from the input file and check if they are live using parallel processing
cat "$INPUT_FILE" | xargs -P 50 -n 1 -I {} bash -c 'check_live_domain "{}"'

echo "Live domains have been saved to $OUTPUT_FILE."
