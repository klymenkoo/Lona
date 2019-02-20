// Compiled by Lona Version 0.5.2

import React from "react"
import styled from "styled-components"

import colors from "../colors"
import shadows from "../shadows"
import textStyles from "../textStyles"

export default class BoxModelConditional extends React.Component {
  render() {


    let Inner$height
    let Inner$marginBottom
    let Inner$marginLeft
    let Inner$marginRight
    let Inner$marginTop
    let Inner$width

    Inner$marginTop = this.props.margin
    Inner$marginRight = this.props.margin
    Inner$marginBottom = this.props.margin
    Inner$marginLeft = this.props.margin
    Inner$height = this.props.size
    Inner$width = this.props.size
    return (
      <Outer>
        <Inner
          style={{
            marginTop: Inner$marginTop + "px",
            marginRight: Inner$marginRight + "px",
            marginBottom: Inner$marginBottom + "px",
            marginLeft: Inner$marginLeft + "px",
            width: Inner$width + "px",
            height: Inner$height + "px"
          }}

        />
      </Outer>
    );
  }
};

let Outer = styled.div({
  alignItems: "flex-start",
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start",
  paddingTop: "4px",
  paddingRight: "4px",
  paddingBottom: "4px",
  paddingLeft: "4px"
})

let Inner = styled.div({
  alignItems: "flex-start",
  backgroundColor: "#D8D8D8",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  width: "60px",
  height: "60px"
})