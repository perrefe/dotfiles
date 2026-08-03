#!/bin/bash
printf "\nTesting Font Styles in Alacritty:\n\n"
printf "\033[0mThis is Regular text (should be standard weight)\033[0m\n"
printf "\033[1mThis is Bold text (should be thick/Bold weight)\033[0m\n"
printf "\033[3mThis is Italic text (mapped to Light weight - should be very thin)\033[0m\n"
printf "\033[1;3mThis is Bold+Italic text (mapped to SemiBold weight - should be medium thick)\033[0m\n\n"
