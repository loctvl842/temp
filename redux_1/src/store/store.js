import { createContext, useReducer } from "react";
import counterReducer from "./reducer";

const INIT_STATE = {
  value: 0,
};

const CounterStore = createContext(INIT_STATE);

const CounterStoreProvider = ({ children }) => {
  const [state, dispatch] = useReducer(counterReducer, INIT_STATE);
  const value = {
    counter: state,
    dispatch,
  };
  return (
    <CounterStore.Provider value={value}>{children}</CounterStore.Provider>
  );
};

export { CounterStoreProvider, CounterStore };
