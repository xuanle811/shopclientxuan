import Home from '~/pages/Home';
import { Route, Routes } from 'react-router-dom';
import Catalog from '~/pages/Catalog';
import Cart from '~/pages/Cart';
import Product from '~/pages/Product';

const PublicRoutes = () => {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/catalog" element={<Catalog />} />
      <Route path="/catalog/:slug" element={<Product />} />
      <Route path="/cart" element={<Cart />} />
    </Routes>
  );
};

export { PublicRoutes };
