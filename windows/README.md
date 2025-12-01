## Setting up GMAIL SMTP Notifications in AAP Controller

1. [Enable Gmail SMTP Server in Gmail Settings](https://access.redhat.com/solutions/7117803)
2. Create a new email notification template:

   *  Navigate to the Administration menu and select Notifications.
   *  Click Add to create a new notification template.
   *  Provide a Name (e.g., "Send Gmail Alerts") and select Email as the Type.
   *  Specify the required SMTP settings to connect to Gmail:
     *   Host: smtp.gmail.com
     *   Port: 587 (for TLS) or 465 (for SSL)
     *   Username: Your full Gmail address
     *   Password: Your Gmail password or an App Password
     *   Connection Security: Select St

