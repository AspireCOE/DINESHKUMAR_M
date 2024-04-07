const header = document.querySelector("header");

window.addEventListener("scroll", function () {
  header.classList.toggle("sticky", window.scrollY > 150);
});

// wishlist toggle function
const wishLists = document.querySelectorAll(".wishlist");

wishLists.forEach((wishList) => {
  wishList.addEventListener("click", () => {
    console.log(wishList);
    wishList.classList.remove("ri-heart-3-line");
    
    wishList.classList.add("ri-heart-3-fill");
    console.log(wishList);
  });
});


// wishlist header

const btnWishList = document.querySelector("#wishlist-icon");
const wishList = document.querySelector(".wishlist-section");
const wishListClose = document.querySelector("#wishlist-close");

btnWishList.addEventListener("click", () => {
  wishList.classList.add("wishlist-active");
});

wishListClose.addEventListener("click", () => {
  wishList.classList.remove("wishlist-active");
});

// wishlist functions 
document.addEventListener("DOMContentLoaded", loadWishList);

function loadWishList() {
  loadList();
}

function loadList(){
  // remove items from wishlist
  let wishListRemove = document.querySelectorAll(".wishlist-trash");
  wishListRemove.forEach((btn) => {
    btn.addEventListener("click", remove);
  });

    // add to wishlist items
    let wishListBtns = document.querySelectorAll(".wishlist");
    wishListBtns.forEach((btn) => {
      btn.addEventListener("click", addWishList);
    });
}
//errorrr
function remove() {
  if (confirm("Are you sure to remove from WishList?")) {
    this.parentElement.remove();
    loadList();
  }
}
let wishListItems = [];

// add items to wishlist 
function addWishList() {
  let item = this.parentElement;
  let title = item.querySelector(".item-title").innerHTML;
  let price = item.querySelector(".item-price").innerHTML;
  let imgSrc = item.querySelector(".product-img").src;

  let newProduct = {title,price,imgSrc}

  //   check product already exist in cart
  if (wishListItems.find((el) => el.title == newProduct.title)) {
    alert("Product already added to wishlist!");
    return;
  } else {
    wishListItems.push(newProduct);
  }

  let newProductElement = createWishList(title, price, imgSrc);
  let element = document.createElement("div");
  element.innerHTML = newProductElement;
  let wishListBasket = document.querySelector(".wishlist-content");
  wishListBasket.append(element);
  loadList();
}

function createWishList(title, price, imgSrc) {
  return ` 
  <div class="wishlist-box">
  <img class="cart-img" src="${imgSrc}" alt="sofa-img" />
  <div class="wishlist-detail">
    <div class="wishlist-item">${title}</div>
    <div class="wishlist-price">${price} </div>
  </div>
  <i class="ri-close-large-line wishlist-trash"></i>
</div>
    `;
}


// cart 

const btnCart = document.querySelector("#cart-icon");
const cart = document.querySelector(".cart");
const btnClose = document.querySelector("#cart-close");

btnCart.addEventListener("click", () => {
  cart.classList.add("cart-active");
});

btnClose.addEventListener("click", () => {
  cart.classList.remove("cart-active");
});


// cart functions
document.addEventListener("DOMContentLoaded", loadCart);

function loadCart() {
  loadContent();
}

function loadContent() {
  // remove items from cart
  let btnRemove = document.querySelectorAll(".cart-trash");
  btnRemove.forEach((btn) => {
    btn.addEventListener("click", removeItem);
  });

  // product quantity change event
  let qtyElements = document.querySelectorAll(".cart-quantity");
  qtyElements.forEach((input) => {
    input.addEventListener("change", changeQty);
  });

  // add to cart items
  let cartBtns = document.querySelectorAll(".add-cart");
  cartBtns.forEach((btn) => {
    btn.addEventListener("click", addCart);
  });

  updateTotal();
}

// removes item
function removeItem() {
  if (confirm("Are you sure to remove this item?")) {
    let title=this.parentElement.querySelector('.cart-sofa-title').innerHTML;
    itemList=itemList.filter(el=>el.title!=title);
    this.parentElement.remove();
    loadContent();
  }
}

// change quantity-only positive num
function changeQty() {
  // isNan-->is not a number
  if (isNaN(this.value) || this.value < 1) {
    this.value = 1;
  }
  loadContent();
}

let itemList = [];
// add cart
function addCart() {
  let item = this.parentElement;
  let title = item.querySelector(".item-title").innerHTML;
  let price = item.querySelector(".item-price").innerHTML;
  let imgSrc = item.querySelector(".product-img").src;

  let newProduct = {title,price,imgSrc}

  //   check product already exist in cart
  if (itemList.find((el) => el.title == newProduct.title)) {
    alert("Product already added in cart");
    return;
  } else {
    itemList.push(newProduct);
  }

  let newProductElement = createCartProduct(title, price, imgSrc);
  let element = document.createElement("div");
  element.innerHTML = newProductElement;
  let cartBasket = document.querySelector(".cart-content");
  cartBasket.append(element);
  loadContent();
}

function createCartProduct(title, price, imgSrc) {
  return `
    <div class="cart-box">
        <img class="cart-img" src="${imgSrc}" alt="sofa-img" />
        <div class="detail-box">
            <div class="cart-sofa-title">${title}</div>
            <div class="price-box">
                <div class="cart-price">${price} </div>
                <div class="cart-amt">${price}</div>
            </div>
            <span>Quantity
            <input type="number" value="1" class="cart-quantity" /></span>
        </div>
        <i class="ri-delete-bin-line cart-trash"></i>
    </div>
    `;
}

function updateTotal(){
  const cartItems=document.querySelectorAll('.cart-box');
  const totalValue=document.querySelector('.total-price');

  let total=0;

  cartItems.forEach(product=>{
    let priceElement=product.querySelector('.cart-price');
    let price=parseFloat(priceElement.innerHTML.replace("₹",""));
    console.log(price);
    //"Rs.40" to 40
    let qty=product.querySelector('.cart-quantity').value;
    product.querySelector('.cart-amt').innerText="Rs."+(price*qty);
    total+=price*qty;
  });
  totalValue.innerHTML="Rs."+total;
}

const placeOrder=document.querySelector('.btn-buy');
placeOrder.addEventListener('click',()=>{
  confirm("Do you want to place the order?");
  alert("Your Order is placed!");
});