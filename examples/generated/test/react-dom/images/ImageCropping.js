// Compiled by Lona Version 0.5.2

import React from "react"
import styled from "styled-components"

import colors from "../colors"
import shadows from "../shadows"
import textStyles from "../textStyles"

export default class ImageCropping extends React.Component {
  render() {



    return (
      <View>
        <AspectFit>
          <ImageResizeModeContain src={require("../assets/icon_128x128.png")} />
        </AspectFit>
        <AspectFill>
          <ImageResizeModeCover src={require("../assets/icon_128x128.png")} />
        </AspectFill>
        <StretchFill>
          <ImageResizeModeStretch src={require("../assets/icon_128x128.png")} />
        </StretchFill>
        <FixedAspectFill src={require("../assets/icon_128x128.png")} />
        <FixedStretch src={require("../assets/icon_128x128.png")} />
      </View>
    );
  }
};

let ImageResizeModeContain = styled.img({
  width: "100%",
  height: "100%",
  objectFit: "contain",
  position: "absolute"
})

let ImageResizeModeCover = styled.img({
  width: "100%",
  height: "100%",
  objectFit: "cover",
  position: "absolute"
})

let ImageResizeModeStretch = styled.img({
  width: "100%",
  height: "100%",
  objectFit: "stretch",
  position: "absolute"
})

let View = styled.div({
  alignItems: "flex-start",
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let AspectFit = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  overflow: "hidden",
  height: "100px",
  position: "relative"
})

let AspectFill = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  overflow: "hidden",
  height: "100px",
  position: "relative"
})

let StretchFill = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  overflow: "hidden",
  height: "100px",
  position: "relative"
})

let FixedAspectFill = styled.img({
  alignItems: "flex-start",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  overflow: "hidden",
  width: "200px",
  height: "100px",
  objectFit: "cover",
  position: "relative"
})

let FixedStretch = styled.img({
  alignItems: "flex-start",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  overflow: "hidden",
  width: "200px",
  height: "100px",
  objectFit: "fill",
  position: "relative"
})