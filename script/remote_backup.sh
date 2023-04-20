#!/bin/env bash

# Load configuration
source config.cfg

function copy_source() {
	selected_source="$1"
	echo "Copying selected path: $selected_source"
	echo "${SYNC_COMMAND[@]} ${EXCLUDE_LIST[@]} ${USERNAME}@${SOURCE_IP}:${selected_source} ${DESTINATION}"
	"${SYNC_COMMAND[@]}" "${EXCLUDE_LIST[@]}" ${USERNAME}@${SOURCE_IP}:$selected_source ${DESTINATION}
}

# Read sources from file and store them in an array
SOURCES=()
while IFS="" read source || [[ -n $source ]]
do
	SOURCES+=("$source")
done < "${SOURCES_FILE}"

if [ "$1" == "--menu" ] || [ "$1" == "-m" ]; then
	# Display menu for the user
	echo "Select a path to copy:"
	i=1
	for source in "${SOURCES[@]}"
	do
		echo "$i) $source"
		i=$((i+1))
	done

	# Get user selection
	echo -n "Enter the number corresponding to the path you want to copy: "
	read choice

	if [[ "$choice" -gt 0 && "$choice" -le "${#SOURCES[@]}" ]]; then
		# Perform the copy operation
		selected_source="${SOURCES[$choice-1]}"
		copy_source "$selected_source"
	else
		echo "Invalid choice. Exiting."
		exit 1
	fi
else
	# Perform the copy operation for all sources
	for source in "${SOURCES[@]}"
	do
		copy_source "$source"
	done
fi
