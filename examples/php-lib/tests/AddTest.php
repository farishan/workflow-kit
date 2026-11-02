<?php

declare(strict_types=1);

namespace PhpLib\Tests;

use PhpLib\Add;
use PHPUnit\Framework\TestCase;

class AddTest extends TestCase
{
    public function testAdd(): void
    {
        $this->assertSame(5, Add::add(2, 3));
    }
}
