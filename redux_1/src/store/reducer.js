const INIT_STATE = {
  value: 0,
};

const counterReducer = (state = INIT_STATE, action) => {
  switch (action.type) {
    case "counter/increase":
      return {
        ...state,
        value: state.value + action.payload,
      };
    case "counter/decrease":
      return {
        ...state,
        value: state.value - action.payload,
      };
    default:
      return state;
  }
};

export default counterReducer;
