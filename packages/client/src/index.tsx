import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { value } from '@cantor/common';

const renderApp = () => {
  ReactDOM.render(
    <div>{value} from React!</div>,
    document.getElementById('app')
  );
};

renderApp();
