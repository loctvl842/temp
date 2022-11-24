export const increase = (value) => {
  return {
    type: "counter/increase",
    payload: value,
  };
};

export const decrease = (value) => {
  return {
    type: "counter/decrease",
    payload: value,
  };
};
