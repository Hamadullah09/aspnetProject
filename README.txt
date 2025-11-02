Complaint Management System - ASP.NET Web Forms

What you get:
- Complete ASP.NET Web Forms project files (ASPX, code-behind, master pages).
- App_Code helpers: DbHelper.cs and Cryptography.cs.
- SQL initialization script: App_Data/InitDB.sql
- Styling using Bootstrap and simple site.css.

Important: This environment cannot create a real SQL Server .mdf file. To run the project locally:
1. Install Visual Studio with ASP.NET and SQL Server Express / LocalDB.
2. In SQL Server Management Studio or using Visual Studio Server Explorer:
   a. Create a new database ComplaintDB or attach an MDF.
   b. Run App_Data/InitDB.sql to create tables.
   c. Use the Cryptography.HashSha256 helper (or an online SHA256 Base64 tool) to generate password hashes for admin and it accounts, then insert them, or update the script.
3. In Web.config the connection string uses LocalDB and |DataDirectory|. If you attach a .mdf, place it in the project's App_Data and update the filename.
4. Build and run the project in Visual Studio.

If you want, I can generate a pre-configured backup file that you can restore locally, but I cannot create a valid SQL Server data file here. I included the SQL script and everything you need to create the DB locally.
