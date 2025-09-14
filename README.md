# QR Code Food Ordering System

A comprehensive, enterprise-grade web application for QR code-based food ordering in cafes and restaurants. Customers scan QR codes at their tables to browse menus, add items to cart, and place orders with multiple payment options. The system features real-time notifications, inventory management, role-based access control, and comprehensive analytics.

## 🚀 Enhanced Features

### 💳 Payment Integration
- **Multiple Payment Methods**: Razorpay, Stripe, UPI, Cards, Wallets
- **Pay at Table Option**: Traditional offline payment
- **Payment Verification**: Secure payment processing and verification
- **Refund Management**: Complete refund processing system
- **Payment Analytics**: Transaction tracking and reporting

### 👥 Role-Based Access Control
- **Admin Dashboard**: Full system management and analytics
- **Waiter/Staff Interface**: Order management and customer service
- **Kitchen Dashboard**: Dedicated kitchen staff interface
- **User Management**: Secure authentication and authorization
- **Permission System**: Granular access control

### 📱 Push Notifications & PWA
- **Firebase Cloud Messaging**: Real-time push notifications
- **Customer Notifications**: Order status updates ("Your order is ready 🚀")
- **Staff Alerts**: New order notifications and updates
- **Progressive Web App**: Mobile app-like experience
- **Offline Support**: Basic functionality without internet

### 📊 Inventory Management
- **Stock Tracking**: Real-time inventory monitoring
- **Auto Stock Updates**: Automatic inventory reduction on sales
- **Low Stock Alerts**: Proactive notifications for restocking
- **Out of Stock Management**: Dynamic item availability
- **Inventory Analytics**: Stock movement and reporting

### 📈 Analytics Dashboard
- **Sales Reports**: Daily, weekly, monthly sales analytics
- **Popular Items**: Most ordered items tracking
- **Performance KPIs**: Average prep time, order completion rates
- **Revenue Analytics**: Payment method analysis and trends
- **Customer Insights**: Order patterns and preferences

### 🍳 Kitchen Management
- **Kitchen Dashboard**: Dedicated interface for kitchen staff
- **Order Queue**: Real-time order processing workflow
- **Prep Time Tracking**: Estimated vs actual preparation times
- **Status Updates**: Order progression management
- **Kitchen Analytics**: Performance metrics and optimization

### 🛠 Advanced Technical Features
- **Spring Boot 3.5.5**: Latest Spring Boot with Java 17
- **MySQL Database**: Robust data persistence with JPA/Hibernate
- **RESTful APIs**: Comprehensive API endpoints
- **WebSocket Support**: Real-time updates and notifications
- **Security Integration**: Spring Security with role-based access
- **Docker Support**: Containerized deployment
- **Cloud Ready**: AWS, Render, Railway deployment configurations

## System Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Customer      │    │   QR Code       │    │   Admin         │
│   Mobile        │◄──►│   Scanner       │◄──►│   Dashboard     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Spring Boot Application                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────┐ │
│  │   Menu API  │  │  Order API  │  │   QR Code   │  │ Twilio  │ │
│  │             │  │             │  │   Service   │  │ Service │ │
│  └─────────────┘  └─────────────┘  └─────────────┘  └─────────┘ │
└─────────────────────────────────────────────────────────────────┘
                                │
                                ▼
                    ┌─────────────────┐
                    │   MySQL         │
                    │   Database      │
                    └─────────────────┘
```

## Prerequisites

- **Java 17** or higher
- **Maven 3.6+**
- **MySQL 8.0+**
- **Twilio Account** (for SMS/WhatsApp notifications)

## Installation & Setup

### 1. Database Setup

Create a MySQL database:
```sql
CREATE DATABASE mottamaadi_cafe;
```

Update database credentials in `src/main/resources/application.properties`:
```properties
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 2. Twilio Configuration

1. Sign up for a [Twilio account](https://www.twilio.com/)
2. Get your Account SID and Auth Token
3. Purchase a phone number for SMS/WhatsApp
4. Update Twilio credentials in `application.properties`:

```properties
twilio.account.sid=your_account_sid
twilio.auth.token=your_auth_token
twilio.phone.number=your_twilio_phone_number
admin.phone.number=your_admin_phone_number
```

### 3. Build and Run

```bash
# Clone the repository
git clone <repository-url>
cd food-ordering

# Build the project
mvn clean install

# Run the application
mvn spring-boot:run
```

The application will start on `http://localhost:9090`

## Usage Guide

### 1. Generate QR Codes

1. Visit `http://localhost:9090`
2. Enter a table number (e.g., "1", "2", "3")
3. Click "Generate QR Code"
4. Print the QR code and place it on the table

### 2. Customer Ordering

1. Customer scans QR code with phone camera
2. Menu page opens automatically
3. Browse categories or search items
4. Add items to cart
5. Review order and add notes
6. Place order

### 3. Admin Management

1. Visit `http://localhost:9090/admin`
2. View real-time order statistics
3. Filter orders by status
4. Update order status (Confirm → Preparing → Ready → Delivered)
5. View detailed order information

## API Endpoints

### Menu API
- `GET /api/menu` - Get all available menu items
- `GET /api/menu/categories` - Get all categories
- `GET /api/menu/category/{category}` - Get items by category
- `GET /api/menu/search?q={query}` - Search menu items
- `GET /api/menu/{id}` - Get specific menu item

### Order API
- `POST /api/orders` - Create new order
- `GET /api/orders` - Get all orders
- `GET /api/orders/table/{tableNumber}` - Get orders by table
- `GET /api/orders/status/{status}` - Get orders by status
- `GET /api/orders/pending` - Get pending orders
- `GET /api/orders/{id}` - Get specific order
- `PUT /api/orders/{id}/status?status={status}` - Update order status

### Payment API
- `POST /api/payments/razorpay/create` - Create Razorpay order
- `POST /api/payments/stripe/create` - Create Stripe payment intent
- `POST /api/payments/razorpay/verify` - Verify Razorpay payment
- `POST /api/payments/stripe/verify` - Verify Stripe payment
- `POST /api/payments/{paymentId}/refund` - Process refund
- `GET /api/payments/order/{orderId}` - Get payment by order
- `GET /api/payments/statistics` - Get payment statistics

### Inventory API
- `GET /api/inventory/summary` - Get inventory summary
- `GET /api/inventory/low-stock` - Get low stock items
- `GET /api/inventory/out-of-stock` - Get out of stock items
- `PUT /api/inventory/{menuItemId}/stock` - Update stock quantity
- `POST /api/inventory/{menuItemId}/add-stock` - Add stock
- `POST /api/inventory/{menuItemId}/reduce-stock` - Reduce stock
- `PUT /api/inventory/{menuItemId}/tracking` - Toggle inventory tracking

### User Management API
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/users` - Get all users (Admin only)
- `POST /api/users` - Create new user (Admin only)
- `PUT /api/users/{id}` - Update user (Admin only)
- `DELETE /api/users/{id}` - Delete user (Admin only)

## Database Schema

### Menu Items Table
```sql
CREATE TABLE menu_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DOUBLE NOT NULL,
    image_url VARCHAR(500),
    is_available BOOLEAN DEFAULT TRUE,
    category VARCHAR(100)
);
```

### Orders Table
```sql
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    table_number VARCHAR(50) NOT NULL,
    order_time DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    total_amount DOUBLE,
    notes TEXT
);
```

### Order Items Table
```sql
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    menu_item_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE,
    total_price DOUBLE,
    special_instructions TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);
```

### Users Table
```sql
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Payments Table
```sql
CREATE TABLE payments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    amount DOUBLE NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_gateway_id VARCHAR(255),
    transaction_id VARCHAR(255),
    gateway_response TEXT,
    payment_time DATETIME,
    refund_amount DOUBLE DEFAULT 0.0,
    refund_time DATETIME,
    refund_reason VARCHAR(500),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
```

## Configuration

### Application Properties
```properties
# Server Configuration
server.port=9090
app.base.url=http://localhost:9090
app.qr.size=300

# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/mottamaadi_cafe
spring.datasource.username=root
spring.datasource.password=password
spring.jpa.hibernate.ddl-auto=update

# Twilio Configuration
twilio.account.sid=${TWILIO_ACCOUNT_SID}
twilio.auth.token=${TWILIO_AUTH_TOKEN}
twilio.phone.number=${TWILIO_PHONE_NUMBER}
admin.phone.number=${ADMIN_PHONE_NUMBER}
```

## Order Status Flow

```
PENDING → CONFIRMED → PREPARING → READY → DELIVERED
    ↓
CANCELLED
```

## Sample Menu Items

The system comes pre-loaded with sample menu items including:
- **Beverages**: Masala Chai, Coffee, Cold Coffee, Fresh Lime Soda, Mango Lassi
- **Snacks**: Samosa, Pakora, Vada Pav, Bread Pakora, Onion Rings
- **Main Course**: Dal Rice, Chicken Curry, Vegetable Biryani, Paneer Butter Masala, Fish Curry
- **Desserts**: Gulab Jamun, Ras Malai, Ice Cream, Kheer, Jalebi

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL is running
   - Check database credentials
   - Ensure database exists

2. **Twilio Notifications Not Working**
   - Verify Twilio credentials
   - Check phone number format (+1234567890)
   - Ensure sufficient Twilio balance

3. **QR Code Not Generating**
   - Check ZXing dependencies
   - Verify base URL configuration

### Logs
Enable debug logging by setting `debug=true` in `application.properties`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License.

## 🚀 Deployment

The system supports multiple deployment options:

### Quick Deploy Options
- **Railway**: One-click deployment with `railway.toml`
- **Render**: Simple deployment with `render.yaml`
- **AWS Elastic Beanstalk**: Enterprise deployment with `.ebextensions`
- **Docker**: Containerized deployment with `docker-compose.yml`

### Deployment Platforms
- **Railway**: Modern platform with built-in database
- **Render**: Simple deployment with automatic SSL
- **AWS**: Enterprise-grade with auto-scaling
- **DigitalOcean**: Developer-friendly with managed databases
- **Google Cloud**: Scalable cloud infrastructure

### Environment Setup
1. **Database**: MySQL 8.0+ (local or cloud)
2. **Payment Gateways**: Razorpay/Stripe accounts
3. **Notifications**: Twilio account for SMS/WhatsApp
4. **Push Notifications**: Firebase project for FCM
5. **Environment Variables**: Configure all API keys

For detailed deployment instructions, see [DEPLOYMENT.md](DEPLOYMENT.md)

## 📱 Progressive Web App (PWA)

The system includes PWA capabilities:
- **Offline Support**: Basic functionality without internet
- **Push Notifications**: Real-time order updates
- **App-like Experience**: Install on mobile devices
- **Responsive Design**: Works on all screen sizes

## 🔒 Security Features

- **Role-Based Access Control**: Admin, Waiter, Kitchen Staff roles
- **Secure Authentication**: Spring Security integration
- **Payment Security**: PCI-compliant payment processing
- **Data Encryption**: Secure data transmission
- **Input Validation**: Comprehensive data validation

## 📊 Analytics & Reporting

- **Sales Analytics**: Revenue tracking and trends
- **Order Analytics**: Order patterns and performance
- **Inventory Analytics**: Stock movement and optimization
- **Customer Analytics**: Customer behavior insights
- **Performance KPIs**: Key performance indicators

## 🛠 Development

### Prerequisites
- Java 17+
- Maven 3.6+
- MySQL 8.0+
- Node.js (for frontend development)

### Local Development
```bash
# Clone repository
git clone <repository-url>
cd food-ordering

# Setup database
mysql -u root -p < init.sql

# Run application
mvn spring-boot:run

# Access application
http://localhost:9090
```

### Docker Development
```bash
# Build and run with Docker Compose
docker-compose up --build

# Access application
http://localhost:9090
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:
- **Documentation**: Check README.md and DEPLOYMENT.md
- **Issues**: Create an issue in the repository
- **Email**: Contact the development team
- **Community**: Join our developer community
