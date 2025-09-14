# Deployment Guide - QR Code Food Ordering System

This guide covers deployment options for the QR Code Food Ordering System on various cloud platforms.

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- MySQL 8.0+ (or cloud database)
- Twilio account for SMS/WhatsApp
- Razorpay/Stripe account for payments
- Firebase project for push notifications

## Environment Variables

Set these environment variables in your deployment platform:

```bash
# Database Configuration
SPRING_DATASOURCE_URL=jdbc:mysql://your-db-host:3306/mottamaadi_cafe
SPRING_DATASOURCE_USERNAME=your_db_username
SPRING_DATASOURCE_PASSWORD=your_db_password

# Twilio Configuration
TWILIO_ACCOUNT_SID=your_twilio_account_sid
TWILIO_AUTH_TOKEN=your_twilio_auth_token
TWILIO_PHONE_NUMBER=your_twilio_phone_number
ADMIN_PHONE_NUMBER=your_admin_phone_number

# Payment Configuration
RAZORPAY_KEY_ID=your_razorpay_key_id
RAZORPAY_KEY_SECRET=your_razorpay_key_secret
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key

# Firebase Configuration
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_SERVICE_ACCOUNT_KEY=path/to/service-account-key.json

# Application Configuration
APP_BASE_URL=https://your-domain.com
SPRING_PROFILES_ACTIVE=production
```

## Deployment Options

### 1. Railway Deployment

Railway is a modern platform for deploying applications with built-in database support.

#### Steps:
1. **Create Railway Account**: Sign up at [railway.app](https://railway.app)
2. **Connect Repository**: Connect your GitHub repository
3. **Add MySQL Database**: Add a MySQL service
4. **Set Environment Variables**: Configure all required environment variables
5. **Deploy**: Railway will automatically build and deploy your application

#### Configuration:
- Use the `railway.toml` file for Railway-specific settings
- Railway provides automatic HTTPS and custom domains
- Built-in monitoring and logs

### 2. Render Deployment

Render offers simple deployment with automatic scaling and SSL.

#### Steps:
1. **Create Render Account**: Sign up at [render.com](https://render.com)
2. **Create Web Service**: Connect your GitHub repository
3. **Add Database**: Create a PostgreSQL or MySQL database
4. **Configure Environment**: Set all environment variables
5. **Deploy**: Render will build and deploy automatically

#### Configuration:
- Use the `render.yaml` file for Render-specific settings
- Automatic SSL certificates
- Built-in health checks and monitoring

### 3. AWS Elastic Beanstalk

AWS Elastic Beanstalk provides managed deployment with auto-scaling.

#### Steps:
1. **Install EB CLI**: `pip install awsebcli`
2. **Initialize EB**: `eb init`
3. **Create Environment**: `eb create production`
4. **Configure Database**: Set up RDS MySQL instance
5. **Set Environment Variables**: Configure in EB console
6. **Deploy**: `eb deploy`

#### Configuration:
- Use `.ebextensions/01-environment.config` for EB settings
- Integrates with RDS, S3, and other AWS services
- Auto-scaling and load balancing included

### 4. DigitalOcean App Platform

DigitalOcean provides simple deployment with managed databases.

#### Steps:
1. **Create DigitalOcean Account**: Sign up at [digitalocean.com](https://digitalocean.com)
2. **Create App**: Connect your GitHub repository
3. **Add Database**: Create managed MySQL database
4. **Configure Environment**: Set environment variables
5. **Deploy**: DigitalOcean handles the deployment

### 5. Docker Deployment

Deploy using Docker containers for maximum flexibility.

#### Local Development:
```bash
# Build and run with Docker Compose
docker-compose up --build
```

#### Production Deployment:
```bash
# Build Docker image
docker build -t mottamaadi-cafe .

# Run with environment variables
docker run -d \
  -p 9090:9090 \
  -e SPRING_DATASOURCE_URL=jdbc:mysql://your-db:3306/mottamaadi_cafe \
  -e SPRING_DATASOURCE_USERNAME=username \
  -e SPRING_DATASOURCE_PASSWORD=password \
  mottamaadi-cafe
```

## Database Setup

### MySQL Configuration

1. **Create Database**:
```sql
CREATE DATABASE mottamaadi_cafe;
CREATE USER 'cafe_user'@'%' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON mottamaadi_cafe.* TO 'cafe_user'@'%';
FLUSH PRIVILEGES;
```

2. **Connection String**:
```
jdbc:mysql://your-host:3306/mottamaadi_cafe?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC
```

### Cloud Database Options

- **AWS RDS**: Managed MySQL with automatic backups
- **Google Cloud SQL**: Fully managed MySQL
- **Azure Database for MySQL**: Managed MySQL service
- **PlanetScale**: Serverless MySQL platform
- **Railway MySQL**: Simple managed MySQL

## SSL/HTTPS Configuration

### Automatic SSL (Recommended)
Most platforms provide automatic SSL:
- Railway: Automatic HTTPS
- Render: Automatic SSL certificates
- AWS Elastic Beanstalk: Load balancer SSL
- DigitalOcean: Automatic SSL

### Manual SSL Configuration
If using custom domains:
1. Obtain SSL certificate (Let's Encrypt recommended)
2. Configure reverse proxy (Nginx/Apache)
3. Update `APP_BASE_URL` to use HTTPS

## Monitoring and Logging

### Application Monitoring
- **Railway**: Built-in metrics and logs
- **Render**: Application metrics dashboard
- **AWS CloudWatch**: Comprehensive monitoring
- **DigitalOcean**: Application monitoring

### Log Management
- **Application Logs**: Spring Boot logging configuration
- **Database Logs**: Monitor query performance
- **Payment Logs**: Track payment transactions
- **Error Tracking**: Consider Sentry or similar service

## Security Considerations

### Environment Variables
- Never commit sensitive data to version control
- Use platform-specific secret management
- Rotate API keys regularly

### Database Security
- Use strong passwords
- Enable SSL connections
- Restrict database access by IP
- Regular security updates

### Application Security
- Enable HTTPS in production
- Configure CORS properly
- Implement rate limiting
- Regular dependency updates

## Performance Optimization

### Database Optimization
- Use connection pooling
- Optimize queries with indexes
- Monitor slow queries
- Consider read replicas for scaling

### Application Optimization
- Enable JVM optimizations
- Configure caching (Redis recommended)
- Use CDN for static assets
- Monitor memory usage

### Scaling Considerations
- Horizontal scaling with load balancers
- Database scaling strategies
- Caching layer implementation
- CDN for global distribution

## Backup and Recovery

### Database Backups
- Automated daily backups
- Point-in-time recovery
- Cross-region backup replication
- Test restore procedures

### Application Backups
- Code repository backups
- Configuration backups
- Environment variable backups
- Disaster recovery plan

## Troubleshooting

### Common Issues

1. **Database Connection Issues**:
   - Check connection string format
   - Verify database credentials
   - Ensure database is accessible

2. **Payment Integration Issues**:
   - Verify API keys and secrets
   - Check webhook configurations
   - Test in sandbox mode first

3. **Firebase Issues**:
   - Verify service account key
   - Check Firebase project configuration
   - Ensure proper permissions

4. **Twilio Issues**:
   - Verify account credentials
   - Check phone number format
   - Ensure sufficient balance

### Debugging Steps
1. Check application logs
2. Verify environment variables
3. Test API endpoints
4. Check database connectivity
5. Verify external service integrations

## Maintenance

### Regular Tasks
- Monitor application performance
- Update dependencies
- Review security logs
- Backup verification
- Performance optimization

### Updates
- Regular Spring Boot updates
- Security patch updates
- Dependency updates
- Feature enhancements

## Support

For deployment issues:
1. Check platform-specific documentation
2. Review application logs
3. Test locally first
4. Contact platform support if needed

## Cost Optimization

### Platform Costs
- **Railway**: Pay-per-use pricing
- **Render**: Tiered pricing plans
- **AWS**: Pay-as-you-go with free tier
- **DigitalOcean**: Fixed pricing plans

### Optimization Tips
- Use appropriate instance sizes
- Implement caching to reduce database load
- Optimize database queries
- Use CDN for static assets
- Monitor and adjust resources based on usage
