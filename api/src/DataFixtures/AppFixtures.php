<?php

namespace App\DataFixtures;

use App\Entity\Score;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $user = new User();
        $user->setId('3CB314BD-7A45-459C-8754-5AE45468E701');
        $user->setPseudo('admin');
        $user->setPlatform('android');

        $score = new Score();
        $score->setPoint(42);
        $score->setUser($user);

        $manager->persist($user);
        $manager->persist($score);

        $manager->flush();
    }
}
