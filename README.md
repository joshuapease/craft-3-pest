# Pest with Craft & Craft Commerce 3

## Get up and running.

[Install DDEV](https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/)

```
# Start DDEV 
ddev start

# Import Seed DB
ddev craft db/restore ./seed.sql

# Run them tests
ddev craft pest/test
```

## DB Exception on second test

In `tests/ExampleTest.php` two calls to `Plugin::getInstance()->getCarts()->getCart()` causes the following exception

```sql
SQLSTATE[23000]: Integrity constraint violation: 1452 Cannot add or update a child row: a foreign key constraint fails (`db`.`commerce_orders`, CONSTRAINT `fk_bciyywqjyopodmftaovygmzqqjyqhxvvdfqr` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE SET NULL)
The SQL being executed was: INSERT INTO `commerce_orders` (`id`, `number`, `reference`, `itemTotal`, `itemSubtotal`, `email`, `isCompleted`, `dateOrdered`, `datePaid`, `dateAuthorized`, `shippingMethodHandle`, `shippingMethodName`, `paymentSourceId`, `gatewayId`, `orderStatusId`, `couponCode`, `total`, `totalPrice`, `totalPaid`, `totalDiscount`, `totalShippingCost`, `totalTax`, `totalTaxIncluded`, `currency`, `lastIp`, `orderLanguage`, `orderSiteId`, `origin`, `paymentCurrency`, `customerId`, `registerUserOnOrderComplete`, `returnUrl`, `cancelUrl`, `message`, `paidStatus`, `recalculationMode`, `dateUpdated`, `dateCreated`, `shippingAddressId`, `billingAddressId`, `uid`) VALUES (43, 'decb040a3f7d12da473b18c9f162fd1e', NULL, '0', '0', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0', 'USD', NULL, 'en-US', 1, 'web', 'USD', 39, NULL, NULL, NULL, NULL, 'unpaid', 'all', '2023-08-10 23:32:51', '2023-08-10 23:32:51', NULL, NULL, '6ba8c254-f969-402c-a52d-684e7a6bf339')
```