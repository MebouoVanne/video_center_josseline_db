<?php

namespace App\DataFixtures;

use App\Entity\Video;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Generator;
use Faker\Factory;

class AppFixtures extends Fixture
{
    private Generator $faker;

    public function __construct()
    {
        $this->faker = Factory::create('fr_FR');
    }


    public function load(ObjectManager $manager): void
    {
        for($i = 0; $i <50; $i++){
            $video = new Video();
            $video->setTitle($this->faker->title())
                    ->setVideoLink('https://www.youtube.com/embed/'. $this->faker->regexify('[A-Za-z0-9_-]{11}'))
                    ->setDescription($this->faker->text())
                    ->setIsPremiumVideo(mt_rand(0, 1) == 1 ? true : false);
            
            $manager -> persist($video);
        }

        $manager->flush();
    }
}
