// Compiled by Lona Version 0.5.2

import React from "react"
import { Image, View, StyleSheet, TextStyles } from "react-sketchapp"

import colors from "../colors"
import shadows from "../shadows"
import textStyles from "../textStyles"

export default class LocalAsset extends React.Component {
  render() {



    return (
      <View style={styles.view}>
        <Image
          style={styles.image}
          source={require("../assets/icon_128x128.png")}

        />
      </View>
    );
  }
};

let styles = StyleSheet.create({
  view: {
    alignItems: "flex-start",
    backgroundColor: colors.red400,
    flex: 0,
    flexDirection: "column",
    justifyContent: "flex-start"
  },
  image: {
    alignItems: "flex-start",
    backgroundColor: "#D8D8D8",
    flexDirection: "column",
    justifyContent: "flex-start",
    width: 100,
    height: 100,
    resizeMode: "cover"
  },
  imageResizeModeCover: {
    width: "100%",
    height: "100%",
    resizeMode: "cover",
    position: "absolute"
  }
})