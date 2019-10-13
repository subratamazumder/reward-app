import React from "react"
import Accordion from "react-bootstrap/Accordion"
import Card from "react-bootstrap/Card"
import QRGenerator from "../components/qr-generator"
import QRScanner from "../components/qr-scanner"
const QRManager = () => (
  <div>
    <Accordion>
      <Card>
        <Accordion.Toggle as={Card.Header} eventKey="0">
          QR Generator
        </Accordion.Toggle>
        <Accordion.Collapse eventKey="0">
          <Card.Body><QRGenerator/></Card.Body>
        </Accordion.Collapse>
      </Card>
      <Card>
        <Accordion.Toggle as={Card.Header} eventKey="1">
          QR Scanner
        </Accordion.Toggle>
        <Accordion.Collapse eventKey="1">
          <Card.Body><QRScanner/></Card.Body>
        </Accordion.Collapse>
      </Card>
    </Accordion>
  </div>
)

export default QRManager
