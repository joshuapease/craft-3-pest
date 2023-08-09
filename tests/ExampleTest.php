<?php

use craft\commerce\elements\Product;

use function markhuot\craftpest\helpers\http\get;

//
// "Better to light one candle than to curse the darkness." ~ Chinese Proverb
//
// Your test library will grow over time and become more and more complex with each added feature. You will add
// business logic, unwritten rules, and all sorts of odds and ends here. Pest makes it easy to keep track of
// those things that would otherwise be forgotten. If you find yourself adding a code comment or a //todo to
// remember _why_ something is the way it is, add a test.
//
// Before any of that, let's start with a simple test ensures the homepage loads and returns an 200 Ok status code.
get('/')->assertOk();

it('does-the-thing', function() {
    $product = Product::find()->one();

//    get($product->url)
//        ->form()
//        ->fill('purchasables[1][qty]', 10)
//        ->submit()
//        ->assertRedirect();


    /** @var \markhuot\craftpest\test\TestCase $test */
    $test = test();

    $test->post('/actions/commerce/cart/update-cart', [
        'purchasableId' => $product->defaultVariant->id,
        'qty' => 10,
    ]);

    $cart = \craft\commerce\Plugin::getInstance()->getCarts()->getCart();

    expect($cart->lineItems[0]->qty)->toBe(10);
});