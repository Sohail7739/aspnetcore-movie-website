# ASP.NET Core Movie Website

A modern movie website built with ASP.NET Core MVC, upgraded to .NET 8.0.

## Features

- Movie catalog with genres
- User authentication and authorization
- Admin panel for movie management
- Search and filter functionality
- Responsive design
- Entity Framework Core with SQL Server

## Prerequisites

- .NET 8.0 SDK or later
- SQL Server (LocalDB or SQL Server Express)
- Visual Studio 2022 or Visual Studio Code

## Setup Instructions

1. **Clone or download the repository**
   ```bash
   git clone https://github.com/Sohail7739/aspnetcore-movie-website.git
   cd aspnetcore-movie-website
   ```

2. **Restore dependencies**
   ```bash
   dotnet restore
   ```

3. **Configure database connection**
   - Open `appsettings.json`
   - Update the `DevelopmentConnection` connection string if needed
   - Default uses LocalDB: `Server=(localdb)\\mssqllocaldb;Database=aspnet-Movies-...`

4. **Apply database migrations**
   ```bash
   dotnet ef database update
   ```
   Note: The project already includes migrations, so you don't need to create new ones unless you modify the models.

5. **Run the application**
   ```bash
   dotnet run
   ```
   Or open `Movies.sln` in Visual Studio and press F5.

6. **Access the application**
   - Navigate to `https://localhost:5001` or `http://localhost:5000`
   - The application will be running

## Project Structure

- `Controllers/` - MVC Controllers
- `Models/` - Data models and ViewModels
- `Views/` - Razor views
- `DAL/` - Data Access Layer (Repository pattern)
- `Data/` - DbContext and database configuration
- `Services/` - Application services
- `wwwroot/` - Static files (CSS, JS, images)

## Technologies Used

- ASP.NET Core 8.0 MVC
- Entity Framework Core 8.0
- SQL Server
- ASP.NET Core Identity
- Bootstrap (for styling)
- jQuery

## Development

### Running Migrations

If you need to create a new migration:
```bash
dotnet ef migrations add MigrationName
dotnet ef database update
```

### Building the Project

```bash
dotnet build
```

## License

This project is open source and available for educational purposes.

## Repository

GitHub: https://github.com/Sohail7739/aspnetcore-movie-website
