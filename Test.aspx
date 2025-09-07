<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="apa_pack.Test" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Header Bar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        body {
            background: linear-gradient(to right, #fffbe6, #fff3cd);
        }
        header {
            background: linear-gradient(135deg, #f59e0b, #facc15);
        }
        .nav-link:hover {
            color: #1e3a8a;
        }
        .nav-link {
            color: #78350f;
        }
    </style>
</head>
<body>

<header class="text-white py-4 px-6 flex items-center justify-between">
    <div class="flex items-center space-x-4">
        <div class="text-2xl font-bold">LOGO</div>
        <nav class="hidden md:flex space-x-6">
            <a href="#" class="nav-link">Home</a>
            <a href="#" class="nav-link">Account</a>
            <a href="#" class="nav-link">Installation</a>
            <a href="#" class="nav-link">Service Request</a>
            <a href="#" class="nav-link">Report</a>
            <a href="#" class="nav-link">Admin</a>
        </nav>
    </div>

    <div class="flex items-center space-x-4">
        <button class="bg-white text-yellow-600 px-4 py-2 rounded-lg hover:bg-yellow-200">Logout</button>
        <button class="md:hidden focus:outline-none">
            <svg class="w-6 h-6 text-yellow-700" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div>
</header>

<script>
    // Optional: Add JS for mobile menu toggle if needed
</script>

</body>
</html>
