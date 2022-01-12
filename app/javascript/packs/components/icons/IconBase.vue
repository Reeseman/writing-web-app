<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    :width="width"
    :height="height"
    :viewBox="viewBox"
    :aria-labelledby="iconName"
    role="presentation"
  >
    <title
      :id="iconName"
      lang="en"
    >{{ iconName }} icon</title> 
    <g :fill="iconColor">
      <slot />
    </g>
  </svg>
</template>

<script>
export default {
  props: {
    iconName: {
      type: String,
      default: 'write',
      required: true
    },
    width: {
      type: [Number, String],
      default: 20
    },
    height: {
      type: [Number, String],
      default: 20
    },
    iconColor: {
      type: String,
      default: '#000000'
    },
  },
  data() {
    return {
      viewBox: '',
    };
  },
  created() {
    if (this.iconName === 'write') {
      this.viewBox = '-15 -15 484.00019 484';
    } else if (this.iconName === 'gear') {
      this.viewBox = '0 0 512 512';
    } else if (this.iconName === 'papers') {
      this.viewBox = '0 0 512.001 512.001';
    } else if (this.iconName === 'people') {
      this.viewBox = '0 0 512.001 512.001';
    } else if (this.iconName === 'logout') {
      this.viewBox = '0 0 330 330';
    }
  }
};
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  svg {
    display: inline-block;
    vertical-align: baseline;
    margin-bottom: -4px;
  }

</style>
