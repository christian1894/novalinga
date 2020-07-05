/*!

=========================================================
* Paper Kit React - v1.2.0
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-kit-react

* Copyright 2020 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/paper-kit-react/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
import React from "react";

import {
  Button,
  Container,
  Row,
  Col,
} from "reactstrap";

function Index() {
  document.documentElement.classList.remove("nav-open");
  React.useEffect(() => {
    document.body.classList.add("index");
    return function cleanup() {
      document.body.classList.remove("index");
    };
  });
  return (
    <>
      <div className="main">
        <div className="section text-center">
          <Container>
            <Row className="mt-5">
              <Col className="ml-auto mr-auto" md="8">
                <h2 className="title">Aprenda las frases mas importantes de cualquier idioma</h2>
                <h5 className="description">
                  En esta plataforma tendrá acceso a las frases mas populares utilizadas
                  en nuestra vida cotidiana en varios idiomas de forma GRATUITA.
                </h5>
                <br />
                <Button
                  className="btn-round"
                  color="primary"
                  onClick={(e) => e.preventDefault()}
                >
                  Iniciar
                </Button>
              </Col>
            </Row>
            </Container>
            </div>
            </div>
    </>
  );
}

export default Index;
