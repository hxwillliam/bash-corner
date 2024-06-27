#!/bin/bash

declare -A inventory

function display_menu {
    echo "Inventory Management"
    echo "1. Search Item"
    echo "2. Add Item"
    echo "3. Edit Item"
    echo "4. Sort Items"
    echo "5. View Inventory"
    echo "6. Delete Item"
    echo "7. Exit"
    echo "Enter your choice:"
    read choice
}

function search_item {
    echo "Enter item serial number to search:"
    read sn
    if [[ ${inventory[$sn]+_} ]]; then
        echo "Item Found: ${inventory[$sn]}"
    else
        echo -e "\e[5mItem not found.\e[0m"
    fi
}

function add_item {
    echo "Enter item serial number to add:"
    read sn
    if [[ ${inventory[$sn]+_} ]]; then
        echo -e "\e[5mItem already exists.\e[0m"
    else
        echo "Enter item name, quantity and price:"
        read item
        inventory[$sn]=$item
    fi
}

function edit_item {
    echo "Enter item serial number to edit:"
    read sn
    if [[ ${inventory[$sn]+_} ]]; then
        echo "Enter new item name, quantity and price:"
        read item
        inventory[$sn]=$item
    else
        echo -e "\e[5mItem not found.\e[0m"
    fi
}

function sort_items {
    echo "Sorted Inventory" > sorted_inventory.txt
    for key in "${!inventory[@]}"
    do
        echo "$key : ${inventory[$key]}" >> sorted_inventory.txt
    done
    sort -o sorted_inventory.txt sorted_inventory.txt
}

function view_inventory {
    echo "Inventory:"
    for key in "${!inventory[@]}"
    do
        echo "$key : ${inventory[$key]}"
    done
}

function delete_item {
    echo "Enter item serial number to delete:"
    read sn
    if [[ ${inventory[$sn]+_} ]]; then
        unset inventory[$sn]
    else
        echo -e "\e[5mItem not found.\e[0m"
    fi
}

while true
do
    display_menu
    case $choice in
        1) search_item ;;
        2) add_item ;;
        3) edit_item ;;
        4) sort_items ;;
        5) view_inventory ;;
        6) delete_item ;;
        7) break ;;
        *) echo "Invalid choice." ;;
    esac
done