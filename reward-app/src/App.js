import React from 'react';
// import logo from './logo.svg';
import './App.css';
import GoldPriceCalculator from "./components/gold-price-calculator"
import Header from "./components/header"
function App() {
  return (
    <div>
      <Header></Header>
      <GoldPriceCalculator></GoldPriceCalculator>
    </div>
  );
} 

export default App;
