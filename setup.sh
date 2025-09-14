#!/bin/bash

# QR Code Food Ordering System Setup Script

echo "🍽️  Setting up QR Code Food Ordering System..."

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 17 or higher."
    exit 1
fi

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
if [ "$JAVA_VERSION" -lt 17 ]; then
    echo "❌ Java version $JAVA_VERSION is too old. Please install Java 17 or higher."
    exit 1
fi

echo "✅ Java $JAVA_VERSION detected"

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven is not installed. Please install Maven 3.6 or higher."
    exit 1
fi

echo "✅ Maven detected"

# Check if MySQL is running
if ! command -v mysql &> /dev/null; then
    echo "⚠️  MySQL client not found. Please ensure MySQL server is installed and running."
else
    echo "✅ MySQL client detected"
fi

# Create database if it doesn't exist
echo "📊 Setting up database..."
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS mottamaadi_cafe;" 2>/dev/null || {
    echo "⚠️  Could not create database automatically. Please create 'mottamaadi_cafe' database manually."
}

# Build the project
echo "🔨 Building the project..."
mvn clean install -DskipTests

if [ $? -eq 0 ]; then
    echo "✅ Project built successfully!"
else
    echo "❌ Build failed. Please check the error messages above."
    exit 1
fi

echo ""
echo "🎉 Setup complete! Next steps:"
echo ""
echo "1. Configure your database credentials in src/main/resources/application.properties"
echo "2. Set up Twilio credentials for SMS/WhatsApp notifications"
echo "3. Run the application: mvn spring-boot:run"
echo "4. Visit http://localhost:9090 to start using the system"
echo ""
echo "📚 For detailed setup instructions, see README.md"
echo ""
echo "Happy ordering! 🍽️"
