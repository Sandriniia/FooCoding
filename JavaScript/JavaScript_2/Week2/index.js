const products = [
  {
    product: 'Apples',
    best_before: '2021_03_16',
    price: 28,
  },
  {
    product: 'Oranges',
    best_before: '2021_03_12',
    price: 36,
  },
  {
    product: 'Pizza',
    best_before: '2021_03_01',
    price: 120,
  },
  {
    product: 'Milk',
    best_before: '2021_02_27',
    price: 22.5,
  },
  {
    product: 'Chocolate',
    best_before: '2021_06_19',
    price: 24.4,
  },
  {
    product: 'Nuts',
    best_before: '2021_04_08',
    price: 48,
  },
  {
    product: 'Yogurt',
    best_before: '2021_03_02',
    price: 22.5,
  },
  {
    product: 'Mango',
    best_before: '2021_03_13',
    price: 30,
  },
  {
    product: 'Salmon',
    best_before: '2021_02_23',
    price: 120,
  },
];

const productsString = JSON.stringify(products);

function selectMostExpensiveProduct(products) {
  const productsList = JSON.parse(products);
  let maxPriceList = [];
  const maxPrice = productsList.reduce((firstProduct, secondProduct) => {
    return firstProduct['price'] > secondProduct['price'] ? firstProduct : secondProduct;
  });
  productsList.forEach((product) => {
    if (product['price'] === maxPrice['price']) {
      maxPriceList.push(product);
    }
  });
  return JSON.stringify(maxPriceList);
}

console.log(selectMostExpensiveProduct(productsString));

function selectCheapestProduct(products) {
  const productsList = JSON.parse(products);
  let minPriceList = [];
  const minPrice = productsList.reduce(function (firstProduct, secondProduct) {
    return firstProduct['price'] < secondProduct['price'] ? firstProduct : secondProduct;
  });
  productsList.forEach((product) => {
    if (product['price'] === minPrice['price']) {
      minPriceList.push(product);
    }
  });
  return JSON.stringify(minPriceList);
}

console.log(selectCheapestProduct(productsString));
