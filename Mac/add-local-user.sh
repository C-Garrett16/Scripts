#!/bin/bash




# Prompt for user details
read -p "Enter the username: " USERNAME
read -p "Enter the full name: " FULLNAME
read -s -p "Enter the password: " PASSWORD
echo ""
read -p "Should this user be an admin? (y/n): " ADMIN_ANSWER

# Convert y/n to true/false
if [[ "$ADMIN_ANSWER" =~ ^[Yy]$ ]]; then
    ADMIN=true
else
    ADMIN=false
fi


# Create the user
echo "Creating user '$USERNAME'..."
sysadminctl -addUser "$USERNAME" -fullName "$FULLNAME" -password "$PASSWORD"

# Make user admin if selected
if [ "$ADMIN" = true ]; then
    dseditgroup -o edit -a "$USERNAME" -t user admin
    echo "User '$USERNAME' added to admin group."
else
    echo "User '$USERNAME' created as a standard user."
fi

echo "Done."
exit 0
