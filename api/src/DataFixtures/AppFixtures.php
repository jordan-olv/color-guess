<?php

namespace App\DataFixtures;

use App\Entity\Score;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $score = new Score();
        $score->setPseudo('John Doe');
        $score->setPoint(42);
        $manager->persist($score);

        $manager->flush();
    }
}
