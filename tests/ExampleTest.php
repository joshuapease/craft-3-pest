<?php

use craft\commerce\elements\Product;

use craft\commerce\Plugin;
use function markhuot\craftpest\helpers\http\get;

it('gets the count of the cart', function(){
    $cart = Plugin::getInstance()->getCarts()->getCart(false);
    expect($cart->lineItems)->toBeEmpty();
});

it('tries to check cart again', function() {
    Craft::$app->getSession()->destroy();
    $cart = Plugin::getInstance()->getCarts()->getCart(true);

    expect($cart->lineItems)->toBeEmpty();
});