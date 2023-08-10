<?php

use craft\commerce\Plugin;

it('gets the count of the cart', function(){
    $cart = Plugin::getInstance()->getCarts()->getCart(false);
    expect($cart->lineItems)->toBeEmpty();
});

it('get the cart while force saving', function() {
    $cart = Plugin::getInstance()->getCarts()->getCart(true); // Force save throws the DB exception

    expect($cart->lineItems)->toBeEmpty();
});