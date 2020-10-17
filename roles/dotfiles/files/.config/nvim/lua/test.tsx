import React from "react";

export interface SomethingProps {}

const Something: React.FC<SomethingProps> = () => {
  return (
    <div className="testar">
      <h1>Hello</h1>
    </div>
  );
};

export default Something;
