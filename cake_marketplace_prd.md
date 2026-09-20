# Cake Marketplace — Product Requirements Document (PRD)

**Version:** 1.0  
**Status:** Product baseline / MVP planning  
**Date:** 20 September 2026

## 1. Product Overview

### Working concept

A global, multi-vendor cake marketplace that enables a customer in one location to order a cake for themselves or someone else in another location.

**Example:** A customer in the UK can order a birthday cake from a verified vendor in Jos, Nigeria, for delivery to a recipient in Jos.

### Core proposition

> **Send a celebration, wherever they are.**

The platform combines cake discovery, customization, gifting, payment, fulfillment, and delivery into one experience.

### Initial product scope

The MVP focuses on **cakes**. The platform architecture should support future expansion into cupcakes, pastries, flowers, chocolates, gift boxes, and other celebration products without requiring a fundamental redesign.

---

# 2. Product Goals

## Primary goals

1. Make it easy to order cakes for people in other cities or countries.
2. Give customers access to verified local cake vendors.
3. Give vendors a digital marketplace and order-management system.
4. Support both standard cake purchases and custom cake requests.
5. Make scheduled cake ordering reliable.
6. Provide transparent order and fulfillment status.
7. Provide secure marketplace payments and vendor payouts.
8. Build trust through verification, reviews, dispute handling, and clear policies.
9. Create a scalable marketplace that can expand geographically and into other celebration products.

## Non-goals for MVP

The MVP will not initially:

- Operate a proprietary delivery fleet.
- Provide full real-time rider GPS tracking.
- Support every celebration product category.
- Support complex recurring corporate orders.
- Require native mobile apps.
- Automate every vendor verification process.

These can be introduced in later phases.

---

# 3. Target Users

## 3.1 Customers

People who want to purchase cakes for themselves or someone else.

Typical use cases:

- Birthday
- Anniversary
- Wedding
- Graduation
- Congratulations
- Baby celebration
- Corporate event
- Religious/social celebration
- Surprise gift

## 3.2 Recipients

The person receiving the cake. A recipient does not necessarily need a platform account.

## 3.3 Vendors

The marketplace supports:

- Independent/home bakers
- Professional bakeries
- Restaurants
- Hotels
- Other approved businesses selling cakes

## 3.4 Platform administrators

Internal users responsible for:

- Vendor approval
- Marketplace management
- Payments
- Disputes
- Customer support
- Content
- Analytics
- Platform configuration

## 3.5 Future delivery partners

Third-party or platform delivery providers may be integrated later.

---

# 4. Core User Journeys

## 4.1 Standard cake order

1. Customer opens platform.
2. Customer enters delivery location.
3. Platform identifies vendors serving that location.
4. Customer browses vendors/cakes.
5. Customer filters or sorts results.
6. Customer selects a cake.
7. Customer selects available customization options.
8. Customer enters recipient information.
9. Customer selects delivery/pickup method.
10. Customer selects date/time.
11. Customer reviews order.
12. Customer pays.
13. Vendor accepts order.
14. Vendor prepares cake.
15. Order status changes through fulfillment stages.
16. Cake is picked up or delivered.
17. Customer receives completion notification.
18. Customer can review the order/vendor.

## 4.2 Custom cake order

1. Customer selects **Custom Cake Request**.
2. Customer provides description.
3. Customer may upload reference image(s).
4. Customer provides desired date, location, size/quantity, theme, and budget where applicable.
5. Platform identifies suitable vendors.
6. Request is sent to a limited number of relevant vendors.
7. Vendors submit quotes.
8. Customer compares quotes.
9. Customer selects a vendor.
10. Vendor confirms details.
11. Customer pays.
12. Vendor prepares order.
13. Order is fulfilled.
14. Customer reviews order.

---

# 5. Customer Features

## 5.1 Account

Customers can:

- Register
- Log in
- Use guest checkout
- Verify email/phone
- Manage profile
- Save addresses
- View order history
- Reorder
- Save favorite vendors/cakes
- Manage notifications

## 5.2 Location-based discovery

Customer enters:

- Country
- City
- Delivery address/location

The platform shows vendors that serve the selected location.

Vendor availability should consider:

- Delivery zone
- Date
- Operating hours
- Preparation/lead time
- Vendor availability
- Order capacity

## 5.3 Search and filtering

Customers can search by:

- Cake type
- Flavor
- Occasion
- Vendor
- Price
- Rating
- Availability
- Delivery/pickup
- Customizable cakes

Sorting may include:

- Relevance
- Price
- Rating
- Delivery availability
- Preparation time

The platform should not rely solely on vendor rating for ordering results. Availability and suitability for the customer's requested date/location should be significant factors.

## 5.4 Vendor profile

Vendor profiles should contain:

- Business name
- Logo/profile image
- Description
- Location
- Delivery areas
- Opening hours
- Portfolio
- Cakes
- Prices
- Reviews
- Rating
- Verification status
- Minimum preparation time
- Availability information

## 5.5 Cake listing

Each cake listing should support:

- Images
- Name
- Description
- Base price
- Available sizes
- Flavors
- Fillings
- Shapes
- Colors/options
- Add-ons
- Dietary information
- Preparation time
- Availability
- Vendor information

## 5.6 Cake customization

Depending on vendor configuration, customers may select:

- Weight/size
- Flavor
- Filling
- Shape
- Color
- Tier count
- Cake message
- Cake topper
- Decorations
- Add-ons
- Dietary requirements
- Special instructions

Vendors control their own customization options and pricing.

## 5.7 Custom cake requests

Customers can submit:

- Description
- Reference image
- Theme
- Cake type
- Approximate size/quantity
- Event date
- Delivery location
- Budget
- Special instructions

A request can be sent to a limited number of suitable vendors, recommended at **3–5 vendors**.

## 5.8 Gifting

Customer can designate:

- Self
- Another recipient

Recipient details:

- Name
- Phone
- Address
- Delivery instructions
- Landmark/instructions where applicable

Customer can also choose:

- Gift message
- Sender identity visible/hidden
- Recipient notification preferences

## 5.9 Surprise delivery

Customer can select:

> Keep my identity hidden from recipient.

Customer may also choose whether the recipient receives advance delivery notifications.

## 5.10 Scheduling

Customers can select:

- ASAP, where supported
- Future date
- Available delivery/pickup time window

The system must prevent customers from selecting unavailable dates/times.

---

# 6. Fulfillment and Delivery

## 6.1 MVP delivery methods

### A. Customer pickup

Customer or recipient collects the cake.

### B. Customer-arranged pickup

Customer arranges a third-party person/rider.

### C. Vendor delivery

Vendor handles delivery.

## 6.2 Future delivery integration

Later versions may support:

- Platform delivery partners
- Third-party courier APIs
- Real-time rider location
- Automated delivery pricing
- Proof of delivery

## 6.3 Delivery status

MVP statuses:

1. Order placed
2. Awaiting vendor confirmation
3. Accepted
4. Preparation started
5. Ready for pickup/delivery
6. Out for delivery
7. Delivered
8. Cancelled
9. Disputed

## 6.4 Failed delivery

If the recipient is unavailable:

1. Vendor/rider attempts contact.
2. Customer is notified.
3. A defined waiting period applies.
4. Customer can provide updated instructions.
5. Additional delivery fees may apply.
6. If delivery fails, the order enters resolution/dispute handling.

---

# 7. Payments

## 7.1 Payment principle

Customer payment is collected through an approved payment provider.

The platform should support multiple payment methods and currencies as the service expands geographically.

Potential methods include:

- Cards
- Bank transfer/local payment methods
- International payment methods supported by the selected provider

## 7.2 Marketplace payment flow

Recommended flow:

**Customer pays → Payment confirmed → Vendor fulfills → Order completed → Vendor payout**

The exact holding/payout mechanism must comply with the selected payment provider's marketplace capabilities and applicable regulations.

## 7.3 Vendor payout

Recommended default:

**Payout after successful fulfillment**, subject to the platform's dispute window and payment-provider rules.

Vendor finance dashboard should show:

- Gross sales
- Platform fees
- Refunds
- Net earnings
- Pending payout
- Completed payout
- Transaction history

---

# 8. Cancellation and Refunds

Cancellation should depend on order status rather than using a universal one-hour rule.

## Recommended policy

### Before preparation begins

Full or near-full refund according to platform/vendor policy.

### Preparation started

Partial or no refund depending on circumstances and vendor policy.

### Ready/out for delivery

Generally non-refundable except qualifying problems.

### Delivered

Refund only for verified qualifying issues.

The platform must clearly display the applicable cancellation policy before payment.

---

# 9. Reviews and Ratings

Customers can review:

- Cake quality
- Vendor service
- Delivery
- Overall order

Recommended rating structure:

- Cake quality: 1–5
- Vendor service: 1–5
- Delivery: 1–5
- Optional written review

Only verified customers with completed orders should be able to submit reviews.

The platform should provide moderation/reporting tools for abusive or fraudulent reviews.

---

# 10. Vendor Features

## 10.1 Vendor registration

Vendor submits:

- Name/business name
- Contact information
- Location
- Business details
- Identity/business verification information
- Payment/payout details
- Delivery areas
- Operating hours
- Portfolio

Vendor remains pending until approved where manual approval is required.

## 10.2 Verification

Recommended verification layers:

- Email/phone verification
- Identity/business information
- Location information
- Payout/payment verification
- Admin approval

Approved vendors receive a **Verified Vendor** indicator.

## 10.3 Vendor dashboard

Dashboard should display:

- Today's orders
- Upcoming orders
- Pending requests
- Revenue
- Pending payouts
- Completed orders
- Ratings/reviews
- Alerts

## 10.4 Product management

Vendors can:

- Add cake
- Edit cake
- Delete/deactivate cake
- Upload images
- Set prices
- Set sizes
- Set flavors
- Configure add-ons
- Configure customization options
- Set preparation time
- Set availability

## 10.5 Order management

Vendor can:

- Accept order
- Reject order
- View order details
- View recipient information
- Update preparation status
- Mark ready
- Mark delivered
- Handle customer messages

When rejecting an order, vendor should provide a reason.

## 10.6 Availability

Vendor can:

- Set opening hours
- Set holidays
- Block dates
- Set maximum capacity
- Enable vacation/unavailable mode
- Set preparation/lead time

When unavailable, the vendor should not receive incompatible orders.

## 10.7 Delivery configuration

Vendor can configure:

- Pickup available
- Vendor delivery available
- Delivery zones
- Delivery fees
- Minimum order
- Delivery lead time

Delivery zones may be represented by:

- Radius
- Postal/area zones
- Manually selected service areas

---

# 11. Messaging

A customer-vendor messaging feature should support custom orders and order clarification.

Capabilities:

- Text messages
- Order-linked conversations
- Image/reference sharing where appropriate
- Notifications
- Report/block functionality

The platform should apply appropriate controls to reduce off-platform transaction leakage and fraud.

---

# 12. Notifications

## Customer notifications

- Account verification
- Order confirmation
- Payment confirmation
- Vendor acceptance/rejection
- Preparation started
- Ready
- Out for delivery
- Delivered
- Cancellation
- Refund
- Dispute updates
- Messages
- Upcoming-order reminders

## Vendor notifications

- New order
- Custom request
- Customer message
- Payment confirmation
- Cancellation
- Upcoming order
- Review
- Payout

## Channels

- In-app
- Push notifications
- Email
- SMS for critical events

Users should control non-essential notification preferences.

---

# 13. Admin Platform

## 13.1 User management

Admin can:

- Search users
- View profiles
- Suspend accounts
- Reactivate accounts
- Review account activity

## 13.2 Vendor management

Admin can:

- Review applications
- Approve/reject vendors
- Verify documents
- Suspend vendors
- Reactivate vendors
- View vendor performance
- Manage verification status

## 13.3 Order management

Admin can:

- Search orders
- View order details
- Monitor active orders
- View cancelled orders
- Handle exceptions
- Manage disputes

## 13.4 Payments

Admin can view:

- Transactions
- Platform fees
- Refunds
- Vendor payouts
- Payment failures
- Revenue

## 13.5 Content management

Admin can manage:

- Categories
- Featured vendors
- Promotional content
- Platform policies
- Help content

## 13.6 Support/disputes

Admin can:

- Receive complaints
- Investigate orders
- Review evidence
- Communicate with users
- Approve eligible refunds
- Resolve disputes
- Record resolution reasons

## 13.7 Analytics

Dashboard should include:

- Total orders
- Gross merchandise value
- Platform revenue
- Active customers
- Active vendors
- New customers
- New vendors
- Order completion rate
- Cancellation rate
- Refund rate
- Average order value
- Repeat purchase rate
- Vendor acceptance rate
- Vendor response time
- Delivery performance
- Location-level performance

---

# 14. Roles and Permissions

## Customer

Can:

- Browse
- Order
- Pay
- Track
- Message vendors
- Review completed orders
- Manage profile

## Vendor

Can:

- Manage profile
- Manage catalogue
- Manage availability
- Accept/reject orders
- Fulfill orders
- Communicate with customers
- View earnings

## Support/Admin

Can:

- Manage users
- Manage vendors
- Manage orders
- Manage disputes
- Manage payments
- Manage platform content

## Super Admin

Additional capabilities:

- Manage administrators
- Configure platform settings
- Manage fees
- Manage permissions
- Access system-wide analytics

---

# 15. Marketplace Logic

## Vendor eligibility

A vendor should appear for an order only when relevant conditions are satisfied:

- Vendor is approved/active.
- Vendor serves the delivery location.
- Vendor can fulfill the requested date/time.
- Vendor has appropriate availability/capacity.
- Product is available.
- Vendor meets any applicable minimum order requirements.

## Search relevance

Results should prioritize suitability rather than simply rating.

Potential relevance factors:

- Location/service coverage
- Requested date availability
- Cake/product relevance
- Price compatibility
- Vendor response/acceptance history
- Preparation time
- Customer-selected filters
- Rating/reviews

The system should avoid hidden pay-to-win ranking unless promoted placement is explicitly labelled.

---

# 16. Monetization

Recommended initial revenue model:

## 16.1 Commission

Platform takes a percentage of completed transactions.

## 16.2 Customer platform/service fee

A transparent fee may be charged where appropriate.

## 16.3 Future revenue streams

- Vendor subscription plans
- Promoted listings
- Premium vendor tools
- Custom-order service fees
- Delivery fees
- Corporate/event ordering
- Additional celebration products

Pricing should be tested rather than permanently fixed in the initial PRD.

---

# 17. MVP Scope

## Must have

### Customer

- Registration/login
- Guest checkout
- Location search
- Vendor discovery
- Cake catalogue
- Vendor profiles
- Cake customization
- Standard ordering
- Custom cake requests
- Scheduled orders
- Recipient details
- Gift messages
- Surprise/hidden sender option
- Checkout
- Payment
- Order history
- Order status tracking
- Notifications
- Reviews

### Vendor

- Registration
- Verification workflow
- Vendor profile
- Catalogue management
- Pricing
- Customization configuration
- Delivery zones
- Availability
- Order management
- Custom-order quotations
- Messaging
- Earnings/payout information
- Reviews

### Admin

- Vendor approval
- User management
- Order management
- Payment visibility
- Refund/dispute management
- Content management
- Basic analytics
- Support tools

---

# 18. Post-MVP Roadmap

## Phase 2

- Native customer mobile app
- Native/vendor mobile experience
- Delivery partners
- Real-time delivery tracking
- Improved vendor discovery
- Advanced analytics
- Promotions/coupons
- Loyalty/rewards
- Gift cards
- More payment methods

## Phase 3

Expand marketplace to:

- Cupcakes
- Pastries
- Flowers
- Chocolates
- Gift boxes
- Celebration bundles

## Phase 4

Advanced marketplace services:

- Corporate accounts
- Recurring orders
- Event/bulk ordering
- Delivery network
- Vendor subscriptions
- Advanced personalization
- Recommendation engine
- International expansion

---

# 19. Technical Architecture Recommendation

## Frontend

Responsive web application designed mobile-first.

Recommended options include:

- Next.js/React
- TypeScript

The architecture should allow future reuse of backend APIs for native mobile applications.

## Backend

Recommended:

- REST or GraphQL API
- TypeScript/Node.js or another scalable backend framework
- Modular marketplace architecture

Core modules:

- Authentication
- Users
- Vendors
- Products
- Search
- Orders
- Custom requests
- Payments
- Payouts
- Delivery
- Messaging
- Notifications
- Reviews
- Disputes
- Administration
- Analytics

## Database

Recommended relational database:

- PostgreSQL

Potential supporting services:

- Redis for caching/queues
- Object storage for cake images/documents
- Search engine when catalogue scale requires it

## Infrastructure

Use cloud infrastructure with:

- HTTPS
- Database backups
- Monitoring
- Logging
- Secure secret management
- Automated deployments
- Disaster recovery plan

---

# 20. Core Data Model

Major entities:

## User

- id
- name
- email
- phone
- role
- status
- created_at
- updated_at

## Vendor

- id
- owner_user_id
- business_name
- description
- location
- verification_status
- operating_hours
- delivery_configuration
- status

## Product

- id
- vendor_id
- name
- description
- category
- base_price
- images
- preparation_time
- status

## ProductOption

- id
- product_id
- option_type
- option_name
- price_modifier
- availability

## CustomerAddress

- id
- user_id
- address
- city
- country
- location_coordinates
- delivery_instructions

## Order

- id
- customer_id
- vendor_id
- order_type
- status
- subtotal
- delivery_fee
- platform_fee
- total
- currency
- scheduled_date
- scheduled_time_window
- created_at

## OrderItem

- id
- order_id
- product_id
- quantity
- selected_options
- unit_price
- total_price

## Recipient

- id
- order_id
- name
- phone
- address
- instructions
- notification_preference

## CustomRequest

- id
- customer_id
- description
- reference_images
- budget
- requested_date
- location
- status

## VendorQuote

- id
- custom_request_id
- vendor_id
- price
- description
- estimated_completion
- status

## Payment

- id
- order_id
- provider
- provider_reference
- amount
- currency
- status
- created_at

## Payout

- id
- vendor_id
- order_id
- amount
- status
- payout_reference

## Review

- id
- order_id
- customer_id
- vendor_id
- cake_rating
- vendor_rating
- delivery_rating
- comment
- status

## Message

- id
- conversation_id
- sender_id
- message
- attachments
- created_at

---

# 21. Security Requirements

The platform must include:

- Secure authentication
- Password hashing
- Session/token security
- Role-based access control
- Input validation
- API authorization
- Secure payment integration
- Encryption in transit
- Appropriate encryption/storage controls for sensitive data
- Rate limiting
- Abuse prevention
- Audit logs for administrative actions
- Secure file uploads
- Backup and recovery
- Privacy controls

Payment card information should not be stored directly by the platform unless there is a specific compliant architecture for doing so.

---

# 22. Privacy and Compliance

Because the platform is intended to operate internationally, compliance requirements must be considered by jurisdiction.

The product should support:

- Privacy policy
- Terms of service
- Cookie/consent controls where required
- Data access/deletion processes
- Vendor agreements
- Refund/cancellation policy
- Marketplace terms
- Payment-provider compliance
- Applicable tax requirements
- Applicable consumer protection requirements

Legal requirements should be reviewed separately for each launch market.

---

# 23. Edge Cases

The system must account for:

- Vendor rejects order
- Vendor becomes unavailable after order placement
- Cake becomes unavailable
- Customer selects unavailable date
- Payment succeeds but order creation fails
- Payment fails
- Duplicate payment
- Vendor misses preparation deadline
- Customer cancels
- Vendor cancels
- Recipient unavailable
- Wrong address
- Delivery failure
- Damaged/incorrect cake
- Customer disputes order
- Refund fails
- Vendor payout fails
- Customer requests modification
- Custom vendor quote expires
- Multiple vendors respond to one custom request
- Customer does not select a custom quote
- Vendor exceeds capacity
- Fraudulent review
- Fraudulent account
- Chargeback
- Time-zone differences for international customers

---

# 24. Key Product Metrics

## Acquisition

- New customers
- New vendors
- Customer acquisition cost

## Marketplace activity

- Search-to-product-view rate
- Product-view-to-checkout rate
- Checkout completion rate
- Orders per customer
- Active vendors

## Fulfillment

- Vendor acceptance rate
- Average vendor response time
- On-time preparation rate
- On-time delivery rate
- Failed delivery rate

## Financial

- Gross merchandise value
- Average order value
- Platform revenue
- Revenue per order
- Refund rate
- Chargeback rate

## Retention

- Repeat purchase rate
- Customer retention
- Vendor retention
- Customer lifetime value

## Quality

- Average cake rating
- Vendor service rating
- Delivery rating
- Complaint rate
- Dispute rate

---

# 25. Acceptance Criteria for MVP

The MVP is considered functionally ready when:

1. A customer can discover vendors serving a destination.
2. A customer can view vendor profiles and cake products.
3. A customer can customize supported products.
4. A customer can place a standard order.
5. A customer can submit a custom request.
6. Vendors can respond to custom requests with quotations.
7. Customers can select a quotation.
8. Customers can pay successfully.
9. Vendors can accept/reject orders.
10. Vendors can manage preparation status.
11. Customers can see order status.
12. Customers can provide recipient information.
13. Vendors can configure delivery zones.
14. Customers can select supported pickup/delivery options.
15. Admins can approve vendors.
16. Admins can view/manage orders.
17. Admins can handle refunds/disputes.
18. Customers can review completed orders.
19. Vendors can view their earnings/payout status.
20. Critical order/payment events generate appropriate notifications.

---

# 26. Recommended MVP Product Structure

The initial responsive web application should have:

## Public

- Home
- Search
- Vendor directory
- Vendor profile
- Cake/product page
- About
- Help
- Terms
- Privacy

## Customer

- Dashboard
- Orders
- Order details/tracking
- Favorites
- Addresses
- Profile
- Notifications
- Messages
- Payment/order history

## Vendor

- Dashboard
- Orders
- Products
- Custom requests
- Messages
- Availability
- Delivery zones
- Reviews
- Earnings
- Profile/settings

## Admin

- Dashboard
- Users
- Vendors
- Orders
- Custom requests
- Payments
- Payouts
- Refunds/disputes
- Reviews
- Content
- Analytics
- Settings

---

# 27. Product Principles

The product should be built around these principles:

### Trust first
Customers are trusting the platform to deliver something important to another person.

### Location matters
The marketplace must understand where the cake is going, not just where the customer is.

### Availability matters
A beautiful cake listing is useless if the vendor cannot fulfill it on the requested date.

### Customization without complexity
Customers should be able to create personalized cakes without being overwhelmed.

### Transparent pricing
Customers should understand the cake price, customization costs, delivery fees, and platform fees before payment.

### Vendor independence
Vendors should control their products, prices, availability, delivery areas, and operational capacity.

### Marketplace neutrality
Search should help customers find suitable vendors rather than secretly forcing a particular vendor.

### Build for global expansion
Currency, time zones, locations, payment methods, tax, and regulatory requirements should not be hard-coded around a single country.

---

# 28. Product Roadmap Summary

**MVP**
→ Cake marketplace  
→ Verified vendors  
→ Location-based discovery  
→ Standard cakes  
→ Custom cakes  
→ Scheduling  
→ Gifting  
→ Vendor delivery/pickup  
→ Marketplace payments  
→ Order tracking  
→ Reviews  
→ Admin platform

**Phase 2**
→ Mobile apps  
→ Delivery partners  
→ Real-time tracking  
→ Promotions  
→ Loyalty  
→ Gift cards

**Phase 3**
→ Flowers  
→ Chocolates  
→ Gift boxes  
→ Celebration bundles

**Phase 4**
→ Corporate orders  
→ Recurring orders  
→ Full delivery network  
→ International marketplace expansion  
→ Advanced recommendations

---

# 29. Product Vision

The long-term product is not merely an online cake shop.

It is a **global celebration marketplace** that connects people who want to celebrate someone with trusted local businesses capable of creating and delivering that celebration.

The first product is the cake.

The larger opportunity is **helping people send celebrations to loved ones wherever they are.**
