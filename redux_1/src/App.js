import "./App.css";
import { increase, decrease } from "./store/action";
import { useContext } from "react";
import { CounterStore } from "./store/store";

function App() {
  const { counter, dispatch } = useContext(CounterStore);
  const handleIncreaseBtn = () => {
    dispatch(increase(5));
  };
  const handleDecreaseBtn = () => {
    dispatch(decrease(4));
  };
  return (
    <div className="App">
      <div className="container">
        <h1>{counter.value}</h1>
      </div>
      <button onClick={handleIncreaseBtn}>Increase</button>
      <button onClick={handleDecreaseBtn}>Decrease</button>
    </div>
  );
}

export default App;
