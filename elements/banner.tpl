<?php

global $post;

if (is_front_page()) {
	setup_postdata($post);
	$video = $theme->render('video');
	$class = !empty($video) || has_post_thumbnail() ? 'withvid' : 'withoutvid';
	echo '<div class="'.$class.'">';
	if (has_post_thumbnail() && empty($video)) {
		$attach_id = get_post_thumbnail_id($post->ID);
		$attach = wp_get_attachment_image_src($attach_id, 'large');
		$image = '<img src="'.$attach[0].'" />';
		$meta = $theme->metaToData($post->ID);
		if (!empty($meta['featured_image_link'])) {
			$image = '<a href="'.$meta['featured_image_link'].'">'.$image.'</a>';
		}
		echo $this->Html->tag('div', $image, array('class' => 'image'));
	}
	the_content();
	echo '</div>';
} else {
	echo $this->Html->image('banner.jpg', array('parent' => true, 'alt' => 'ROCKHARBOR is a church of communities living out the gospel together.', 'class' => 'full'));
}